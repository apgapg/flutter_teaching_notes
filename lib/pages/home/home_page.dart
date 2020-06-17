import 'package:flutter/material.dart';
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

  var _scrollViewController = ScrollController();

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
    return DefaultTabController(
      length: 2,
      child: BlocProvider(
        bloc: _bloc,
        child: Scaffold(
          body: NestedScrollView(
            controller: _scrollViewController,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  title: Text(
                    isTab(context)
                        ? "IIT-JEE Notes by Ayush P Gupta"
                        : "IIT-JEE Notes",
                  ),
                  pinned: true,
                  floating: true,
                  forceElevated: innerBoxIsScrolled,
                  elevation: 2.0,
                  actions: <Widget>[
                    if (isDebugMode)
                      IconButton(
                          icon: Icon(Icons.device_unknown),
                          onPressed: onUploadTap),
                    IconButton(
                        icon: Icon(Icons.info_outline), onPressed: onInfoTap),
                  ],
                  bottom: const TabBar(
                    tabs: [
                      Tab(text: "QUESTIONS"),
                      Tab(text: "NOTES"),
                    ],
                  ),
                ),
              ];
            },

            /* appBar: AppBar(
            title: Text(
              isTab(context)
                  ? "IIT-JEE Notes by Ayush P Gupta"
                  : "IIT-JEE Notes",
            ),
            elevation: 2.0,
            actions: <Widget>[
              if (isDebugMode)
                IconButton(
                    icon: Icon(Icons.device_unknown), onPressed: onUploadTap),
              IconButton(icon: Icon(Icons.info_outline), onPressed: onInfoTap),
            ],
            bottom: TabBar(
              tabs: [
                Tab(text: "QUESTIONS"),
                Tab(text: "NOTES"),
              ],
            ),
          ),*/
            body: TabBarView(
              children: [
                QuestionsListPage(),
                CourseListPage(),
              ],
            ),
          ),
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
