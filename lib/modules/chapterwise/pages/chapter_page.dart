import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_teaching_notes/modules/chapterwise/models/chapter.dart';
import 'package:flutter_teaching_notes/modules/questions/models/question_model.dart';
import 'package:flutter_teaching_notes/modules/questions/widgets/question_card.dart';
import 'package:flutter_teaching_notes/utils/top_level_utils.dart';
import 'package:flutter_teaching_notes/widgets/error_widget.dart';
import 'package:flutter_teaching_notes/widgets/loading_widget.dart';
import 'package:flutter_teaching_notes/widgets/responsive_container.dart';
import 'package:flutter_teaching_notes/widgets/search/search_text_field.dart';
import 'package:rxdart/rxdart.dart';

class ChapterPage extends StatefulWidget {
  final Chapter item;

  ChapterPage({this.item});

  @override
  _ChapterPageState createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  final _controller = TextEditingController();

  final _textSubject = BehaviorSubject<String>.seeded("");

  StreamTransformer<QuerySnapshot, List<Question>> get levelTransformer =>
      StreamTransformer<QuerySnapshot, List<Question>>.fromHandlers(
          handleData: (query, sink) {
        if (!checkIfListIsNotEmpty(query.documents)) {
          return sink.add([]);
        } else {
          var list = query.documents
              .map((document) => Question.fromJson(document.data)
                  .copyWith(id: document.documentID))
              .toList();
          list.sort((a, b) => (a.level ?? 0).compareTo(b.level ?? 0));
          return sink.add(list);
        }
      });

  StreamTransformer<List<Question>, List<Question>> get searchTransformer =>
      StreamTransformer<List<Question>, List<Question>>.fromHandlers(
          handleData: (list, sink) {
        if (checkIfNotEmpty(_controller.text)) {
          var list1 = list.where((item) {
            return item.title.toLowerCase().contains(
                  _controller.text.toLowerCase(),
                );
          }).toList();
          return sink.add(list1);
        } else {
          return sink.add(list);
        }
      });

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      _textSubject.add(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.item.title ?? "NA"),
          elevation: 2.0,
        ),
        body: StreamBuilder<List<Question>>(
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return Column(
                children: [
                  if (isTab(context))
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          Container(
                            child: SearchTextField(
                              _controller,
                              hint:
                                  'Search among ${snapshot.data.length} questions',
                            ),
                            margin: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                          ),
                          if (snapshot.data.isEmpty)
                            Expanded(
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/images/empty.png',
                                      height: 200,
                                    ),
                                    Text("No questions found"),
                                  ],
                                ),
                              ),
                            )
                          else
                            Expanded(
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 500,
                                  childAspectRatio: 1.4,
                                ),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (_, index) =>
                                    QuestionCard(snapshot.data[index]),
                                itemCount: snapshot.data.length,
                              ),
                            ),
                        ],
                      ),
                    )
                  else
                    Expanded(
                      child: ListView(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                        children: [
                          /*if (checkIfNotEmpty(widget.item.video))
                            Column(
                              children: [
                                PrimaryRaisedButton(
                                  icon: SimpleLineIcons.graduation,
                                  text: "Full Video Lectures".toUpperCase(),
                                  color: Colors.green,
                                  onTap: () {},
                                ),
                              ],
                            ),*/
                          Container(
                            child: SearchTextField(
                              _controller,
                              hint:
                                  'Search among ${snapshot.data.length} questions',
                            ),
                            margin: EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 4,
                            ),
                          ),
                          ...snapshot.data.map(
                            (e) => Container(
                              child: QuestionCard(e),
                              height: MediaQuery.of(context).size.height / 3.2,
                            ),
                          ),
                          if (snapshot.data.isEmpty)
                            Container(
                              margin: EdgeInsets.only(top: 40),
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/images/empty.png',
                                      height: 100,
                                    ),
                                    Text("No question(s) found"),
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
          stream: Rx.combineLatest2<QuerySnapshot, String, QuerySnapshot>(
                  _getStream(), _textSubject, (a, b) => a)
              .transform(levelTransformer)
              .transform(searchTransformer),
        ),
      ),
    );
  }

  Stream<QuerySnapshot> _getStream() {
    final query = Firestore.instance.collection('numericals').where(
          'topic',
          isEqualTo: widget.item.topic,
        );
    return query.snapshots();
  }
}
