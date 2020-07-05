import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_teaching_notes/data/repo/user/base/user_repository.dart';
import 'package:flutter_teaching_notes/di/injector.dart';
import 'package:flutter_teaching_notes/modules/questions/models/question_model.dart';
import 'package:flutter_teaching_notes/modules/questions/widgets/question_card.dart';
import 'package:flutter_teaching_notes/utils/top_level_utils.dart';
import 'package:flutter_teaching_notes/widgets/error_widget.dart';
import 'package:flutter_teaching_notes/widgets/loading_widget.dart';
import 'package:flutter_teaching_notes/widgets/responsive_container.dart';
import 'package:flutter_teaching_notes/widgets/search/search_text_field.dart';
import 'package:rxdart/rxdart.dart';

class BookmarkPage extends StatefulWidget {
  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  final _controller = TextEditingController();

  final _textSubject = BehaviorSubject<String>.seeded("");

  StreamTransformer<QuerySnapshot, List<Question>> get parseTransformer =>
      StreamTransformer<QuerySnapshot, List<Question>>.fromHandlers(
          handleData: (query, sink) {
        if (!checkIfListIsNotEmpty(query.documents)) {
          return sink.add([]);
        } else {
          var list = query.documents
              .map((document) => Question.fromJson(document.data)
                  .copyWith(id: document.documentID))
              .toList();
          list.sort((a, b) => (b.createdAt ?? 0).compareTo(a.createdAt ?? 0));
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

  StreamTransformer<List<Question>, List<Question>> get bookmarkTransformer =>
      StreamTransformer<List<Question>, List<Question>>.fromHandlers(
          handleData: (list, sink) {
        final bookmarks =
            injector<UserRepository>().getUserStream().value?.bookmarks;
        if (checkIfListIsNotEmpty(bookmarks)) {
          var list1 = list.where((item) {
            return bookmarks.contains(item.id);
          }).toList();
          return sink.add(list1);
        } else {
          return sink.add([]);
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
          title: Text('Bookmarks'),
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
                                    Text("No Bookmark(s) found"),
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
                        padding: EdgeInsets.symmetric(vertical: 8),
                        children: [
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
                                    Text("No Bookmark(s) found"),
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
              .transform(parseTransformer)
              .transform(searchTransformer)
              .transform(bookmarkTransformer),
        ),
      ),
    );
  }

  Stream<QuerySnapshot> _getStream() {
    final query = Firestore.instance.collection('numericals');
    return query.snapshots();
  }
}
