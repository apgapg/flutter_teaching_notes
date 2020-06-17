import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_teaching_notes/bloc/bloc_provider.dart';
import 'package:flutter_teaching_notes/bloc/home_bloc.dart';
import 'package:flutter_teaching_notes/pages/contact_page.dart';
import 'package:flutter_teaching_notes/pages/modules/questions/pages/questions_list_page.dart';
import 'package:flutter_teaching_notes/pages/upload/data_upload_page.dart';
import 'package:flutter_teaching_notes/utils/top_level_utils.dart';

import '../modules/course/pages/course_list_page.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final _bloc = HomeBloc();

  final _scrollViewController = ScrollController();

  final _controller = PageController();

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _bloc,
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
            IconButton(
              icon: Icon(SimpleLineIcons.info),
              onPressed: onInfoTap,
              iconSize: 20,
            ),
            SizedBox(
              width: 8,
            )
          ],
        ),
        body: PageView(
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
          children: [
            QuestionsListPage(),
            CourseListPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
            _controller.jumpToPage(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Octicons.question),
              title: Text("Questions"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Octicons.book),
              title: Text("Notes"),
            ),
          ],
        ),
      ),
    );
  }

  void onInfoTap() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ContactPage()));
  }

  void onUploadTap() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => DataUploadPage()));
  }
}

class ErrorPage extends StatelessWidget {
  final String text;

  ErrorPage(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(text),
      ),
    );
  }
}

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 32.0,
              width: 32.0,
              child: CircularProgressIndicator(
                strokeWidth: 1.0,
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Text("Fetching data...")
          ],
        ),
      ),
    );
  }
}
