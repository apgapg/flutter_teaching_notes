import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_teaching_notes/model/course_model.dart';
import 'package:flutter_teaching_notes/widgets/border_container.dart';
import 'package:flutter_teaching_notes/widgets/images/my_image.dart';

import '../pages/course_page.dart';

class CourseCard extends StatelessWidget {
  final CourseItem _item;

  BuildContext context;

  CourseCard(this._item);

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return BorderContainer(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onCourseTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 4.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                  child: MyImage(
                    _item.cover,
                    invertColors: false,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Divider(
                height: 1.0,
                color: Colors.grey[400],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      _item.name,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      _item.description,
                      style: Theme.of(context).textTheme.headline4.copyWith(
                            fontSize: 14,
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
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CoursePage(_item),
      ),
    );
  }
}
