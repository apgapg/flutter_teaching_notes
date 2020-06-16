import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_teaching_notes/utils/top_level_utils.dart';
import 'package:flutter_teaching_notes/widgets/my_popup_menu_button.dart';

import '../../../home/home_page.dart';
import '../models/question_model.dart';
import '../widgets/question_card.dart';

class QuestionsListPage extends StatefulWidget {
  QuestionsListPage();

  @override
  _QuestionsListPageState createState() => _QuestionsListPageState();
}

class _QuestionsListPageState extends State<QuestionsListPage>
    with AutomaticKeepAliveClientMixin {
  int _selectedLevel = 0;

  StreamTransformer<QuerySnapshot, List<Question>> get streamTransformer =>
      StreamTransformer<QuerySnapshot, List<Question>>.fromHandlers(
          handleData: (query, sink) {
        if (!checkIfListIsNotEmpty(query.documents)) {
          return null;
        } else {
          var list = query.documents
              .map((document) => Question.fromJson(document.data))
              .toList();
          if (_selectedLevel != 0) {
            list = list
                .where((element) => element.level == _selectedLevel)
                .toList();
          }
          list.sort((a, b) => (b.createdAt ?? 0).compareTo(a.createdAt ?? 0));
          return sink.add(list);
        }
      });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Question>>(
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16, right: 8),
                child: Row(
                  children: [
                    Text("Subject  "),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 2,
                      ),
                      margin: EdgeInsets.symmetric(
                        vertical: 2,
                      ),
                      child: Text(
                        'Physics',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Spacer(),
                    PopupMenuButton(
                      onSelected: (value) =>
                          setState(() => _selectedLevel = value),
                      itemBuilder: (_) => [
                        MyPopupMenuItem(
                          checked: _selectedLevel == 0,
                          value: 0,
                          child: Text('All'),
                        ),
                        MyPopupMenuItem(
                          checked: _selectedLevel == 1,
                          value: 1,
                          child: Text('Level 1'),
                        ),
                        MyPopupMenuItem(
                          checked: _selectedLevel == 2,
                          value: 2,
                          child: Text('Level 2'),
                        ),
                        MyPopupMenuItem(
                          checked: _selectedLevel == 3,
                          value: 3,
                          child: Text('Level 3'),
                        ),
                      ],
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Level  "),
                            Container(
                              decoration: BoxDecoration(
                                color: getLevelColor(_selectedLevel),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 2,
                              ),
                              margin: EdgeInsets.symmetric(
                                vertical: 2,
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
                                    '${_selectedLevel == 0 ? 'All' : _selectedLevel}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (_, index) => QuestionCard(snapshot.data[index]),
                  itemCount: snapshot.data.length,
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
          .collection('numericals')
          .snapshots()
          .transform(streamTransformer),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
