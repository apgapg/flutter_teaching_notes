import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_teaching_notes/modules/chapterwise/models/chapter.dart';
import 'package:flutter_teaching_notes/modules/chapterwise/pages/chapter_page.dart';
import 'package:flutter_teaching_notes/utils/top_level_utils.dart';

class ChapterCard extends StatelessWidget {
  final Chapter item;
  final int index;

  BuildContext context;

  ChapterCard(this.item, this.index);

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 4.0,
        vertical: 1.0,
      ),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        elevation: 2.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              onTap: onCourseTap,
              trailing: Icon(Icons.keyboard_arrow_right),
              title: Text(
                item.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: checkIfNotEmpty(item.description)
                  ? Text(item.description)
                  : null,
            ),
            if (checkIfNotEmpty(item.subject))
              Container(
                margin: EdgeInsets.only(bottom: 8, left: 16),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                child: Text(
                  item.subject,
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void onCourseTap() {
    FocusScope.of(context).requestFocus(FocusNode());
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChapterPage(item: item),
      ),
    );
  }
}
