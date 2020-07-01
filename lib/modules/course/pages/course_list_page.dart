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
          return Container(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              itemBuilder: (context, index) {
                return CourseCard(list.elementAt(index));
              },
              itemCount: list.length,
            ),
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
