import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_teaching_notes/data/model/user.dart';
import 'package:flutter_teaching_notes/data/repo/user/base/user_repository.dart';
import 'package:flutter_teaching_notes/di/injector.dart';
import 'package:flutter_teaching_notes/main.dart';
import 'package:flutter_teaching_notes/modules/bookmark/pages/bookmark_page.dart';
import 'package:flutter_teaching_notes/modules/chapterwise/index.dart';
import 'package:flutter_teaching_notes/modules/course/pages/course_list_page.dart';
import 'package:flutter_teaching_notes/modules/profile/index.dart';
import 'package:flutter_teaching_notes/modules/questions/pages/questions_list_page.dart';
import 'package:flutter_teaching_notes/pages/contact_page.dart';
import 'package:flutter_teaching_notes/pages/upload/data_upload_page.dart';
import 'package:flutter_teaching_notes/utils/toast_utils.dart';
import 'package:flutter_teaching_notes/utils/top_level_utils.dart';
import 'package:flutter_teaching_notes/widgets/responsive_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final _scrollViewController = ScrollController();

  final _controller = PageController();

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 36,
                width: 36,
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    isTab(context)
                        ? "IIT-JEE Notes by Ayush P Gupta"
                        : "IIT-JEE Notes",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "by Ayush P Gupta",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
            ],
          ),
          elevation: 2.0,
          actions: <Widget>[
            if (isDebugMode)
              IconButton(
                icon: Icon(
                  SimpleLineIcons.bulb,
                ),
                iconSize: 20,
                onPressed: onUploadTap,
              ),
            Tooltip(
              message: "Share App",
              child: IconButton(
                icon: Icon(Icons.share),
                onPressed: () {
                  if (kIsWeb) {
                    launch('https://play.google.com/store/apps/'
                        'details?id=com.coddu.flutter.iitjee.notes');
                  } else {
                    Share.share(
                        'https://play.google.com/store/apps/'
                        'details?id=com.coddu.flutter.iitjee.notes',
                        subject: "Share App Link");
                  }
                },
                iconSize: 24,
              ),
            ),
            StreamBuilder<User>(
                stream: injector<UserRepository>().getUserStream(),
                builder: (context, snapshot) {
                  final user = snapshot.data;
                  return Tooltip(
                    message: "Bookmarks",
                    child: IconButton(
                      icon: Icon(FontAwesomeIcons.bookmark),
                      onPressed: () {
                        if (user == null) {
                          ToastUtils.showLoginToast();
                        } else {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => BookmarkPage(),
                            ),
                          );
                        }
                      },
                      iconSize: 20,
                    ),
                  );
                }),
            Tooltip(
              message: "About",
              child: IconButton(
                icon: Icon(Icons.info_outline),
                onPressed: onInfoTap,
                iconSize: 26,
              ),
            ),
            SizedBox(
              width: 8,
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  QuestionsListPage(),
                  ChapterListPage(),
                  CourseListPage(),
                  ProfilePage(),
                ],
              ),
            ),
            if (kIsWeb)
              GestureDetector(
                onTap: () {
                  analytics.logEvent(name: 'open_in_app');
                  launch('https://play.google.com/store/apps/'
                      'details?id=com.coddu.flutter.iitjee.notes');
                },
                child: Container(
                  height: 36,
                  alignment: Alignment.center,
                  color: Theme.of(context).primaryColor,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.phone_android,
                        size: 16,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "OPEN IN APP",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) {
            analytics.logEvent(name: 'home_tab_change', parameters: {
              "index": index,
            });

            setState(() {
              currentIndex = index;
            });
            _controller.jumpToPage(index);
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Octicons.question),
              title: Text("Mixed"),
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Icon(
                  SimpleLineIcons.docs,
                  size: 20,
                ),
              ),
              title: Text("Chapterwise"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Octicons.book),
              title: Text("Notes"),
            ),
            BottomNavigationBarItem(
              icon: StreamBuilder<User>(
                  stream: injector<UserRepository>().getUserStream(),
                  builder: (context, snapshot) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Stack(
                        children: [
                          Icon(
                            SimpleLineIcons.user,
                            size: 20,
                          ),
                          if (!(snapshot.hasData && snapshot.data != null))
                            Positioned(
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.redAccent,
                                ),
                                height: 8,
                                width: 8,
                              ),
                            )
                        ],
                      ),
                    );
                  }),
              title: Text("Profile"),
            ),
          ],
        ),
      ),
    );
  }

  void onInfoTap() {
    FirebaseAnalytics().logEvent(name: 'about_tap');

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ContactPage()));
  }

  void onUploadTap() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => DataUploadPage()));
  }
}
