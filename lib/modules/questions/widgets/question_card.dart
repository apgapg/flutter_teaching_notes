import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_teaching_notes/data/repo/user/base/user_repository.dart';
import 'package:flutter_teaching_notes/di/injector.dart';
import 'package:flutter_teaching_notes/modules/questions/models/question_model.dart';
import 'package:flutter_teaching_notes/modules/questions/pages/question_page.dart';

import '../../../utils/top_level_utils.dart';
import '../../../widgets/images/my_image.dart';

class QuestionCard extends StatelessWidget {
  final Question item;

  BuildContext context;

  QuestionCard(this.item);

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
        child: InkWell(
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
                              EdgeInsets.symmetric(horizontal: 4, vertical: 2),
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
                            horizontal: 4,
                            vertical: 2,
                          ),
                          child: Text(
                            item.topic,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
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
                              /*Icon(
                                Icons.filter_list,
                                size: 14,
                                color: Colors.white,
                              ),*/
                              Text(
                                'Level ${item.level}',
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
                  vertical: 10.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.title,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                              color: _isbookmarked()
                                  ? MediaQuery.of(context).platformBrightness ==
                                          Brightness.light
                                      ? Theme.of(context).primaryColor
                                      : null
                                  : null,
                            ),
                          ),
                        ),
                        if (_isbookmarked())
                          Icon(
                            Icons.bookmark,
                            color: MediaQuery.of(context).platformBrightness ==
                                    Brightness.light
                                ? Theme.of(context).primaryColor
                                : null,
                            size: 20,
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    if (checkIfNotEmpty(item.description))
                      Text(
                        item.description,
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
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

  bool _isbookmarked() {
    return injector<UserRepository>()
            .getUserStream()
            .value
            ?.bookmarks
            ?.contains(item.id) ??
        false;
  }
}
