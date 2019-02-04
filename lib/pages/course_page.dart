import 'package:flutter/material.dart';
import 'package:flutter_teaching_notes/main.dart';
import 'package:flutter_teaching_notes/model/course_model.dart';
import 'package:flutter_teaching_notes/utils/toast_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class CoursePage extends StatelessWidget {
  final CourseItem item;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  CoursePage(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 2.0,

        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(item.name),
        actions: <Widget>[
          Tooltip(
            message: "Download PDF",
            child: IconButton(
              icon: Icon(Icons.arrow_downward),
              onPressed: onDownloadTap,
            ),
          )
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView.builder(
          padding: EdgeInsets.symmetric(
            vertical: 4.0,
            horizontal: 2.0,
          ),
          // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, childAspectRatio: 1.5),
          itemBuilder: (context, index) {
            return NoteCard(index, item.coursePreffix + (index + 1).toString() + item.suffix);
          },
          itemCount: 100,
        ),
      ),
    );
  }

  void onDownloadTap() async {
    if (await canLaunch(item.pdfLink)) {
      await launch(item.pdfLink);
    } else
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Download not available. Check back later"),
        ),
      );
  }
}
