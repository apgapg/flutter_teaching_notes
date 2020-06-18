import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_teaching_notes/modules/chapterwise/models/chapter.dart';
import 'package:flutter_teaching_notes/utils/top_level_utils.dart';
import 'package:flutter_teaching_notes/widgets/error_widget.dart';
import 'package:flutter_teaching_notes/widgets/loading_widget.dart';

import '../widgets/chapter_card.dart';

class ChapterListPage extends StatefulWidget {
  ChapterListPage();

  @override
  _ChapterListPageState createState() => _ChapterListPageState();
}

class _ChapterListPageState extends State<ChapterListPage>
    with AutomaticKeepAliveClientMixin {
  StreamTransformer<QuerySnapshot, List<Chapter>> get parseTransformer =>
      StreamTransformer<QuerySnapshot, List<Chapter>>.fromHandlers(
        handleData: (query, sink) {
          if (!checkIfListIsNotEmpty(query.documents)) {
            return sink.add([]);
          } else {
            var list = query.documents
                .map((document) => Chapter.fromJson(document.data))
                .toList();
            return sink.add(list);
          }
        },
      );

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Chapter>>(
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  children: [
/*                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Solve Chapter-Wise Numericals",
                            style: Theme.of(context)
                                .textTheme
                                .display4
                                .copyWith(fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )*/
                    ...snapshot.data.map(
                      (e) => ChapterCard(e, snapshot.data.indexOf(e)),
                    ),
                    if (snapshot.data.isEmpty)
                      Container(
                        margin: EdgeInsets.only(top: 100),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/images/empty.png',
                                height: 100,
                              ),
                              Text("No chapter(s) found"),
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              )
            ],
          );
        } else if (snapshot.hasError) {
          return ErrorPage(snapshot.error.toString());
        } else {
          return LoadingPage();
        }
      },
      stream: Firestore.instance
          .collection('chapters')
          .snapshots()
          .transform(parseTransformer),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
