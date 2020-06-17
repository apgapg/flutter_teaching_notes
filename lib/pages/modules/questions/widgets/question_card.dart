import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_teaching_notes/pages/modules/questions/models/question_model.dart';
import 'package:flutter_teaching_notes/pages/modules/questions/pages/question_page.dart';
import 'package:flutter_teaching_notes/utils/top_level_utils.dart';
import 'package:flutter_teaching_notes/widgets/images/my_image.dart';

class QuestionCard extends StatelessWidget {
  final Question item;

  BuildContext context;

  QuestionCard(this.item);

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Container(
      padding: const EdgeInsets.symmetric(
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
        child: GestureDetector(
          onTap: onCourseTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (item.images != null && item.images.isNotEmpty)
                      MyImage(item.images[0]),
                    if (checkIfNotEmpty(item.subject))
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          child: Text(
                            item.subject,
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ),
                    if (checkIfNotEmpty(item.topic))
                      Positioned(
                        left: 8,
                        top: 8,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.yellow[300],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          child: Text(
                            item.topic,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    if (checkIfNotEmpty(item.level?.toString()))
                      Positioned(
                        right: 8,
                        bottom: 4,
                        child: Container(
                          decoration: BoxDecoration(
                            color: getLevelColor(item.level),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 2,
                          ),
                          margin: EdgeInsets.symmetric(
                            vertical: 4,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.filter_list,
                                size: 14,
                                color: Colors.white,
                              ),
                              Text(
                                '${item.level}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Divider(
                height: 1.0,
                color: Colors.grey[400],
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 8.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      item.title,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    if (checkIfNotEmpty(item.description))
                      Text(
                        item.description,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onCourseTap() {
    FocusScope.of(context).requestFocus(FocusNode());
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => QuestionPage(item),
      ),
    );
  }
}
