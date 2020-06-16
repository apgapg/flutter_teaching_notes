import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_teaching_notes/model/course_model.dart';

import '../pages/course_page.dart';

class CourseCard extends StatelessWidget {
  final CourseItem _item;

  BuildContext context;

  CourseCard(this._item);

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 4.0,
        vertical: 1.0,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
        ),
        elevation: 2.0,
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
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: _item.cover,
                      placeholder: (context, url) => Container(
                        alignment: Alignment.center,
                        child: Container(
                          height: 32.0,
                          width: 32.0,
                          child: new CircularProgressIndicator(
                            strokeWidth: 1.0,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          new Icon(Icons.error),
                    ),
                  ),
                ),
                Divider(
                  height: 1.0,
                  color: Colors.grey[400],
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        _item.name,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        _item.description,
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                    ],
                  ),
                )
              ],
            ),
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
