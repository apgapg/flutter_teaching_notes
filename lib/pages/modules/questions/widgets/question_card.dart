import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_teaching_notes/pages/modules/questions/models/question_model.dart';
import 'package:flutter_teaching_notes/utils/top_level_utils.dart';
import 'package:flutter_teaching_notes/widgets/placeholder_image.dart';

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
              Container(
                height: MediaQuery.of(context).size.height / 4,
                child: Stack(
                  children: [
                    if (item.images != null && item.images.isNotEmpty)
                      CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: item.images[0],
                        placeholder: (context, url) => PlaceholderImage(),
                        errorWidget: (context, url, error) =>
                            new Icon(Icons.error),
                      ),
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
                            color: _getColor(item.level),
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
    /*  Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CoursePage(_item),
      ),
    );*/
  }

  Color _getColor(int level) {
    if (level == 1) {
      return Colors.green;
    } else if (level == 2) {
      return Colors.orange;
    } else if (level == 3) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }
}
