import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_teaching_notes/di/injector.dart';
import 'package:flutter_teaching_notes/model/course_model.dart';
import 'package:flutter_teaching_notes/modules/course/pages/topic_page.dart';
import 'package:flutter_teaching_notes/utils/toast_utils.dart';
import 'package:flutter_teaching_notes/utils/top_level_utils.dart';
import 'package:flutter_teaching_notes/widgets/border_container.dart';
import 'package:flutter_teaching_notes/widgets/note_card.dart';
import 'package:flutter_teaching_notes/widgets/responsive_container.dart';
import 'package:url_launcher/url_launcher.dart';

class CoursePage extends StatefulWidget {
  final CourseItem item;

  CoursePage(this.item);

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _notifier = ValueNotifier<List<String>>([]);

  List<String> _imagesList;

  CourseItem item;

  StreamSubscription<DocumentSnapshot> subs;

  @override
  void initState() {
    super.initState();
    item = widget.item;
    if (item.images != null) {
      subs = injector<Firestore>()
          .document('courses/${item.videoLink.split('/').last}')
          .snapshots()
          .listen((event) {
        if (event?.data != null) {
          if (mounted) {
            setState(() {
              item = CourseItem.fromJson(event.data);
              if (checkIfListIsNotEmpty(item.images)) {
                _imagesList = item.images;
              }
            });
          }
        }
      });
    }
    init();
  }

  @override
  void dispose() {
    if (subs != null) {
      subs.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 2.0,
          title: Text(item?.name ?? "NA"),
          actions: <Widget>[
            Tooltip(
              message: "Download PDF",
              child: IconButton(
                icon: Icon(Icons.arrow_downward),
                onPressed: onDownloadTap,
              ),
            )
          ],
          bottom: TabBar(
            indicatorWeight: 3,
            tabs: [
              Tab(
                text: "TOPICs".toUpperCase(),
              ),
              Tab(
                text: "ALL".toUpperCase(),
              ),
            ],
          ),
        ),
        body: ResponsiveContainer(
          child: TabBarView(
            children: [
              if (!checkIfListIsNotEmpty(widget.item.topics))
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/empty.png',
                      height: 200,
                    ),
                    Text(
                      'Don\'t worry! We will update\nthe topics soon.',
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              else
                ListView(
                  physics: BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 8.0,
                  ),
                  children: [
                    ...widget.item.topics.map(
                      (e) => BorderContainer(
                        margin: EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => TopicPage(e),
                              ),
                            );
                          },
                          leading: Container(
                            height: 28,
                            width: 28,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              "${widget.item.topics.indexOf(e) + 1}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          title: Text(
                            e.title ?? "--",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 8.0,
                ),
                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, childAspectRatio: 1.5),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: isDebugMode &&
                            checkIfNotEmpty(item.videoLink) &&
                            checkIfListIsNotEmpty(item.images)
                        ? () async {
                            await removeImage(_imagesList[index]);
                          }
                        : null,
                    child: NoteCard(index, _imagesList[index]),
                  );
                },
                itemCount: _imagesList.length,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.videocam),
          onPressed: () async {
            if (await canLaunch(item.videoLink)) {
              await launch(item.videoLink);
            }
          },
        ),
      ),
    );
  }

  Future<void> init() async {
    if (item.images != null && item.images.isNotEmpty) {
      _imagesList = item.images;
      return;
    }
    final list1 = item.notes
        .map((item) =>
            NotesItem(item.name.split("/").last.split('.')[0], item.url))
        .where((item) =>
            item.name != null &&
            item.name.isNotEmpty &&
            item.url != null &&
            item.url.isNotEmpty)
        .toList();
    list1.sort((a, b) => int.parse(a.name).compareTo(int.parse(b.name)));
    this._imagesList = list1.map((item) => item.url).toList();
  }

  void onDownloadTap() async {
    if (await canLaunch(item?.pdfLink)) {
      await launch(item.pdfLink);
    } else
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Download not available. Check back later"),
        ),
      );
  }

  void addUrl(url) {
    final list = <String>[]..addAll(_notifier.value);
    list.add(url);
    _notifier.value = list;
  }

  Future<void> removeImage(String image) async {
    await showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Remove image?"),
              content: Text("$image"),
              actions: [
                FlatButton(
                  child: Text("YES"),
                  onPressed: () async {
                    final uid = item.videoLink.split('/').last;

                    print(uid);
                    final newSoln = item.images;
                    newSoln.remove(image);
                    injector<Firestore>()
                        .document('courses/${uid}')
                        .updateData({
                      'images': newSoln,
                    });
                    ToastUtils.show("Removed");
                    Navigator.pop(context);
                  },
                )
              ],
            ));
  }
}
