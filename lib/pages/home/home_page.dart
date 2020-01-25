import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_teaching_notes/bloc/bloc_provider.dart';
import 'package:flutter_teaching_notes/bloc/home_bloc.dart';
import 'package:flutter_teaching_notes/model/course_model.dart';
import 'package:flutter_teaching_notes/pages/contact_page.dart';
import 'package:flutter_teaching_notes/pages/home/course_list_page.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final _bloc = HomeBloc();

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
          title: Text("IIT-JEE Notes"),
          elevation: 2.0,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.info_outline), onPressed: onInfoTap)
          ],
        ),
        body: StreamBuilder(
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              final list = snapshot.data.documents
                  .map((document) => CourseItem.fromJson(document.data))
                  .toList();
              return CourseListPage(list);
            } else if (snapshot.hasError)
              return ErrorPage(snapshot.error.toString());
            else
              return LoadingPage();
          },
          stream: Firestore.instance.collection('courses').snapshots(),
        ),
      ),
    );
  }

  void onInfoTap() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ContactPage()));
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
