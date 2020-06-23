import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_teaching_notes/data/model/user.dart';
import 'package:flutter_teaching_notes/data/repo/user/base/user_repository.dart';
import 'package:flutter_teaching_notes/di/injector.dart';
import 'package:flutter_teaching_notes/modules/questions/models/question_model.dart';
import 'package:flutter_teaching_notes/utils/top_level_utils.dart';
import 'package:flutter_teaching_notes/widgets/images/my_image.dart';
import 'package:flutter_teaching_notes/widgets/my_divider.dart';
import 'package:flutter_teaching_notes/widgets/primary_raised_button.dart';
import 'package:url_launcher/url_launcher.dart';

class QuestionPage extends StatefulWidget {
  final Question item;

  QuestionPage(this.item);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _notifier = ValueNotifier<List<String>>([]);

  List<String> list;

  bool _showSolution = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 2.0,

        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.item?.title ?? "NA"),
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
      body: Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (checkIfListIsNotEmpty(widget.item.images))
                for (String image in widget.item.images)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyImage(image),
                      MyDivider(),
                    ],
                  ),
              if (checkIfListIsNotEmpty(widget.item.solutions))
                Container(
                  margin: EdgeInsets.symmetric(vertical: 16),
                  child: PrimaryRaisedButton(
                    icon: Icons.code,
                    color: !_showSolution
                        ? Theme.of(context).primaryColor
                        : Colors.red,
                    text: !_showSolution ? "VIEW SOLUTIONS" : "HIDE SOLUTIONS",
                    onTap: () {
                      setState(() {
                        _showSolution = !_showSolution;
                      });
                    },
                  ),
                )
              else
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
                      'Don\'t worry! We will update\nthe answer update soon.',
                      style: Theme.of(context)
                          .textTheme
                          .display1
                          .copyWith(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              if (_showSolution && checkIfListIsNotEmpty(widget.item.solutions))
                for (final soln in widget.item.solutions)
                  if (checkIfListIsNotEmpty(soln.images))
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (checkIfNotEmpty(soln.video))
                          Container(
                            margin: EdgeInsets.only(bottom: 16),
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
                        MyDivider(),
                        for (String image in soln.images)
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              MyImage(image),
                              MyDivider(),
                            ],
                          ),
                      ],
                    ),
              if (!_showSolution &&
                  checkIfListIsNotEmpty(widget.item.solutions))
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/write.jpg',
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: StreamBuilder<User>(
          stream: injector<UserRepository>().getUserStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              final user = snapshot.data;
              return BottomAppBar(
                child: InkWell(
                  onTap: () {
                    if (checkIfListIsNotEmpty(user.bookmarks) &&
                        user.bookmarks.contains(widget.item.id)) {
                      injector<UserRepository>().removeBookmark(widget.item.id);
                    } else {
                      injector<UserRepository>().saveBookmark(widget.item.id);
                    }
                  },
                  child: checkIfListIsNotEmpty(user.bookmarks) &&
                          user.bookmarks.contains(widget.item.id)
                      ? Container(
                          height: 44,
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
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          height: 44,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.bookmark_border,
                                size: 20,
                                color: Theme.of(context).primaryColor,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Add to Bookmarks",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
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
            }
          }),
    );
  }
}
