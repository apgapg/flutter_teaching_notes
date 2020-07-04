import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_teaching_notes/main.dart';
import 'package:flutter_teaching_notes/modules/chapterwise/models/chapter.dart';
import 'package:flutter_teaching_notes/modules/chapterwise/pages/chapter_page.dart';
import 'package:flutter_teaching_notes/utils/top_level_utils.dart';
import 'package:flutter_teaching_notes/widgets/border_container.dart';

class ChapterCard extends StatelessWidget {
  final Chapter item;
  final int index;

  BuildContext context;

  ChapterCard(
    this.item,
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return BorderContainer(
      margin: const EdgeInsets.symmetric(
        vertical: 4.0,
      ),
      child: InkWell(
        onTap: onCourseTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                trailing: Icon(Icons.keyboard_arrow_right),
                title: Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 16,
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
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Text(
                    item.subject,
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void onCourseTap() {
    analytics.logEvent(
      name: "question_tap",
      parameters: {
        "id": item.title,
      },
    );
    FocusScope.of(context).requestFocus(FocusNode());
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChapterPage(item: item),
      ),
    );
  }
}
