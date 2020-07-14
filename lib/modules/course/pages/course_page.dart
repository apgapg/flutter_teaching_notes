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

class CoursePage extends StatefulWidget {
  final CourseItem item;

  CoursePage(this.item);

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _notifier = ValueNotifier<List<String>>([]);

  CourseItem item;

  StreamSubscription<DocumentSnapshot> subs;

  @override
  void initState() {
    super.initState();
    item = widget.item;
//    if (item.images != null) {
//      subs = injector<Firestore>()
//          .document('courses/${item.videoLink.split('/').last}')
//          .snapshots()
//          .listen((event) {
//        if (event?.data != null) {
//          if (mounted) {
//            setState(() {
//              item = CourseItem.fromJson(event.data);
//              if (checkIfListIsNotEmpty(item.images)) {
//                _imagesList = item.images;
//              }
//            });
//          }
//        }
//      });
//    }
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
    return ResponsiveContainer(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            elevation: 2.0,
            title: Text(item?.name ?? "NA"),
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
          body: TabBarView(
            children: [
              if (!checkIfListIsNotEmpty(widget.item.topics))
                NoItemsFound()
              else
                ListView(
                  physics: BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 8.0,
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4.0,
                        horizontal: 2,
                      ),
                      child: Text(
                        "Total Units: ${widget.item.topics.length}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ...widget.item.topics.map(
                      (e) => BorderContainer(
                        margin: EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => TopicPage(
                                  e,
                                  widget.item,
                                ),
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
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              if (checkIfListIsNotEmpty(item.topics))
                ListView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 8.0,
                  ),
                  children: [
                    for (final topic in item.topics)
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              border:
                                  Border.all(color: Colors.orange, width: 2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: const EdgeInsets.all(8.0),
                            margin: const EdgeInsets.all(6.0),
                            child: Text(
                              '${'${item.topics.indexOf(topic) + 1}. '}${topic.title}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          ...topic.images.map(
                            (e) => GestureDetector(
//                              onLongPress: isDebugMode
//                                  ? () async {
//                                      await removeImage(e);
//                                    }
//                                  : null,
                              child: NoteCard(
                                topic.images.indexOf(e),
                                e,
                              ),
                            ),
                          )
                        ],
                      )
                  ],
                )
              else
                NoItemsFound()
            ],
          ),
        ),
      ),
    );
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
              injector<Firestore>().document('courses/${uid}').updateData({
                'images': newSoln,
              });
              ToastUtils.show("Removed");
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

class NoItemsFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/empty.png',
          height: 200,
        ),
        Text(
          'Don\'t worry! We will update\nthe topics soon.',
          style: Theme.of(context).textTheme.display1.copyWith(fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
