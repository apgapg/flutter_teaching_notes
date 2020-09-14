import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart' as es;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_teaching_notes/data/model/my_user.dart';
import 'package:flutter_teaching_notes/data/repo/user/base/user_repository.dart';
import 'package:flutter_teaching_notes/di/injector.dart';
import 'package:flutter_teaching_notes/modules/questions/models/question_model.dart';
import 'package:flutter_teaching_notes/utils/log_utils.dart';
import 'package:flutter_teaching_notes/utils/toast_utils.dart';
import 'package:flutter_teaching_notes/utils/top_level_utils.dart';
import 'package:flutter_teaching_notes/widgets/border_container.dart';
import 'package:flutter_teaching_notes/widgets/images/my_image.dart';
import 'package:flutter_teaching_notes/widgets/my_divider.dart';
import 'package:flutter_teaching_notes/widgets/pdf_widget.dart';
import 'package:flutter_teaching_notes/widgets/primary_raised_button.dart';
import 'package:flutter_teaching_notes/widgets/responsive_container.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:url_launcher/url_launcher.dart';

class QuestionPage extends StatefulWidget {
  final Question item;

  QuestionPage(this.item);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> list;

  //bool _showSolution = false;

  Question item;

  StreamSubscription<DocumentSnapshot> subs;

  String _pdfPath;

  @override
  void initState() {
    super.initState();
    item = widget.item;
    if (widget.item.id != null) {
      subs = injector<Firestore>()
          .doc('numericals/${item.id}')
          .snapshots()
          .listen((event) {
        if (event?.data != null) {
          if (mounted) {
            setState(() {
              item = Question.fromJson(event.data())
                  .copyWith(id: event.documentID);
            });
          }
        }
      });
    }

    getpdf();
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
            title: Text(item?.title ?? "NA"),
            bottom: TabBar(
              indicatorWeight: 3,
              tabs: [
                Tab(
                  text: "Numerical".toUpperCase(),
                ),
                Tab(
                  text: "Solution".toUpperCase(),
                ),
              ],
            ),
            /* actions: <Widget>[
              Tooltip(
                message: "Download PDF",
                child: IconButton(
                  icon: Icon(Icons.arrow_downward),
                  onPressed: onDownloadTap,
                ),
              )
            ],*/
          ),
          body: Column(
            children: [
              Expanded(
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (checkIfListIsNotEmpty(item.images))
                            for (String image in item.images)
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.orange[300],
                                        width: 4,
                                      ),
                                    ),
                                    child: MyImage(
                                      image,
                                      tapEnabled: true,
                                    ),
                                  ),
                                  MyDivider(),
                                ],
                              ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/images/write.png',
                                height: 200,
                              ),
                              Text(
                                'It\'s good if you try solving first yourself.\nRead again and again.',
                                style: Theme.of(context)
                                    .textTheme
                                    .display1
                                    .copyWith(fontSize: 14),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          if (checkIfNotEmpty(_pdfPath))
                            BorderContainer(
                              margin: EdgeInsets.symmetric(
                                vertical: 6,
                                horizontal: 8,
                              ),
                              child: PdfWidget(_pdfPath),
                            ),
                          BorderContainer(
                            margin: EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 8,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                ListTile(
                                  title: Text(
                                    "Ask your friends to try!",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  isThreeLine: true,
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Share this numerical with your friend circle.",
                                      ),
                                      Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: () async {
                                            if (kIsWeb) {
                                              launch(
                                                  'https://play.google.com/store/apps/'
                                                  'details?id=com.coddu.flutter.iitjee.notes');
                                            } else {
                                              final rawfile =
                                                  await DefaultCacheManager()
                                                      .getSingleFile(
                                                          item.images[0]);
                                              final bytes =
                                                  rawfile.readAsBytesSync();
                                              await es.Share.file(
                                                  'Solve numerical',
                                                  '${widget.item.title}.png',
                                                  bytes,
                                                  'image/jpeg',
                                                  text:
                                                      'Hey! Try out this numerical from ${widget.item.topic}.'
                                                      '\n\nVisit: http://iitjeenotes.web.app/'
                                                      '\n\n©IIT-JEE Notes by APG');
                                            }
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 4.0),
                                                  child: Icon(
                                                    SimpleLineIcons.share,
                                                    size: 14,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  "Share this Question",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headline4
                                                      .copyWith(
                                                        fontSize: 14,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (!kIsWeb)
                            Container(
                              child: HtmlWidget(
                                '''<iframe src='https://player.uacdn.net/lesson-raw/player/v585/player-min.html?uuid=${widget.item.id}&use_imgix=1&autoPlay=false&debug=false'></iframe>''',
                                webView: true,
                              ),
                            ),
                          if (!checkIfListIsNotEmpty(item.solutions))
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 16),
                                  child: PrimaryRaisedButton(
                                    icon: Icons.code,
                                    text: "NO SOLUTIONS",
                                    onTap: null,
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/empty.png',
                                  height: 200,
                                ),
                                Text(
                                  'Don\'t worry! We will update\nthe solution soon.',
                                  style: Theme.of(context)
                                      .textTheme
                                      .display1
                                      .copyWith(fontSize: 14),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )
                          else
                            for (final soln in item.solutions)
                              if (checkIfListIsNotEmpty(soln.images))
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    if (checkIfNotEmpty(soln.video))
                                      Container(
                                        margin: EdgeInsets.only(
                                          bottom: 8,
                                          top: 8,
                                        ),
                                        child: PrimaryRaisedButton(
                                          icon: Icons.videocam,
                                          color: Colors.green,
                                          text: "VIDEO SOLUTION",
                                          onTap: () async {
                                            if (await canLaunch(soln.video)) {
                                              await launch(soln.video);
                                            }
                                          },
                                        ),
                                      ),
                                    for (String image in soln.images)
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          if (isDebugMode)
                                            Text(
                                              image,
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          MyDivider(),
                                          GestureDetector(
                                            onLongPress: isDebugMode &&
                                                    checkIfNotEmpty(item.id)
                                                ? () async {
                                                    await removeImage(
                                                        soln, image);
                                                  }
                                                : null,
                                            child: MyImage(
                                              image,
                                              tapEnabled: true,
                                            ),
                                          ),
                                          MyDivider(),
                                          SizedBox(
                                            height: 8,
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: StreamBuilder<MyUser>(
              stream: injector<UserRepository>().getUserStream(),
              builder: (context, snapshot) {
                final user = snapshot.data;

                return BottomAppBar(
                  child: InkWell(
                    onTap: user == null
                        ? () {
                            ToastUtils.showLoginToast();
                          }
                        : () {
                            if (checkIfListIsNotEmpty(user.bookmarks) &&
                                user.bookmarks.contains(item.id)) {
                              injector<UserRepository>()
                                  .removeBookmark(item.id);
                            } else {
                              injector<UserRepository>().saveBookmark(item.id);
                            }
                          },
                    child: user != null &&
                            checkIfListIsNotEmpty(user.bookmarks) &&
                            user.bookmarks.contains(item.id)
                        ? Container(
                            height: 48,
                            alignment: Alignment.center,
                            color: Theme.of(context).primaryColor,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.bookmark,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Added to Bookmarks",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            height: 48,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.bookmark_border,
                                  size: 20,
                                  color: MediaQuery.of(context)
                                              .platformBrightness ==
                                          Brightness.light
                                      ? Theme.of(context).primaryColor
                                      : null,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Add to Bookmarks",
                                  style: TextStyle(
                                    color: MediaQuery.of(context)
                                                .platformBrightness ==
                                            Brightness.light
                                        ? Theme.of(context).primaryColor
                                        : null,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ),
                );
                /*if (snapshot.hasData && snapshot.data != null) {
                  final user = snapshot.data;
                  return BottomAppBar(
                    child: InkWell(
                      onTap: () {
                        if (checkIfListIsNotEmpty(user.bookmarks) &&
                            user.bookmarks.contains(item.id)) {
                          injector<UserRepository>().removeBookmark(item.id);
                        } else {
                          injector<UserRepository>().saveBookmark(item.id);
                        }
                      },
                      child: checkIfListIsNotEmpty(user.bookmarks) &&
                              user.bookmarks.contains(item.id)
                          ? Container(
                              height: 48,
                              alignment: Alignment.center,
                              color: Theme.of(context).primaryColor,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.bookmark,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Added to Bookmarks",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              height: 48,
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.bookmark_border,
                                    size: 20,
                                    color: MediaQuery.of(context)
                                                .platformBrightness ==
                                            Brightness.light
                                        ? Theme.of(context).primaryColor
                                        : null,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Add to Bookmarks",
                                    style: TextStyle(
                                      color: MediaQuery.of(context)
                                                  .platformBrightness ==
                                              Brightness.light
                                          ? Theme.of(context).primaryColor
                                          : null,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  );
                } else {
                  return SizedBox(
                    height: 0,
                    width: 0,
                  );
                }*/
              }),
        ),
      ),
    );
  }

  Future<void> removeImage(Solution soln, String image) async {
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Remove image?"),
        content: Text("$image"),
        actions: [
          FlatButton(
            child: Text("YES"),
            onPressed: () async {
              final newSoln = soln.images;
              newSoln.remove(image);
              injector<Firestore>().doc('numericals/${item.id}').updateData({
                'solutions': [soln.toJson()]
              });
              ToastUtils.show("Removed");
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  void getpdf() async {
    try {
      final storageReference = FirebaseStorage()
          .ref()
          .child('chapter-pdf/${item.topic}/${item.title} ${item.id}.pdf');
      final path = await storageReference.getDownloadURL();
      print(path);
      if (mounted) {
        setState(() {
          _pdfPath = path;
        });
      }
    } catch (e, s) {
      logger.e(s, s);
    }
  }
}
