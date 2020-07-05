import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_teaching_notes/model/course_model.dart';
import 'package:flutter_teaching_notes/modules/course/widgets/course_card.dart';
import 'package:flutter_teaching_notes/widgets/error_widget.dart';
import 'package:flutter_teaching_notes/widgets/loading_widget.dart';

class CourseListPage extends StatefulWidget {
  CourseListPage();

  @override
  _CourseListPageState createState() => _CourseListPageState();
}

class _CourseListPageState extends State<CourseListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          final list = snapshot.data.documents
              .map((document) => CourseItem.fromJson(document.data))
              .toList();
          list.sort((a, b) => a.name.compareTo(b.name));

          return ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              vertical: 6.0,
              horizontal: 8,
            ),
            children: [
              const Align(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "Study chapter wise notes",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ...list.map((e) => CourseCard(e))
            ],
          );
        } else if (snapshot.hasError) {
          return ErrorPage(snapshot.error.toString());
        } else {
          return LoadingPage();
        }
      },
      stream: Firestore.instance.collection('courses').snapshots(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
