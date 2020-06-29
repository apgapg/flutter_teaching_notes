import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_teaching_notes/utils/top_level_utils.dart';
import 'package:flutter_teaching_notes/widgets/error_widget.dart';
import 'package:flutter_teaching_notes/widgets/loading_widget.dart';
import 'package:flutter_teaching_notes/widgets/my_popup_menu_button.dart';
import 'package:flutter_teaching_notes/widgets/search/search_text_field.dart';
import 'package:rxdart/rxdart.dart';

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

  final _controller = TextEditingController();

  final _textSubject = BehaviorSubject<String>.seeded("");

  StreamTransformer<QuerySnapshot, List<Question>> get levelTransformer =>
      StreamTransformer<QuerySnapshot, List<Question>>.fromHandlers(
          handleData: (query, sink) {
        if (!checkIfListIsNotEmpty(query.documents)) {
          return null;
        } else {
          var list = query.documents
              .map((document) => Question.fromJson(document.data)
                  .copyWith(id: document.documentID))
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
    return StreamBuilder<List<Question>>(
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return Column(
            children: [
              if (isTab(context))
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          left: 16,
                          right: 8,
                          top: 2,
                          bottom: 2,
                        ),
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
                              onSelected: (value) {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                setState(() => _selectedLevel = value);
                              },
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
                    padding: EdgeInsets.symmetric(vertical: 2),
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          left: 16,
                          right: 8,
                          top: 2,
                          bottom: 2,
                        ),
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
          Firestore.instance.collection('numericals').snapshots(),
          _textSubject,
          (a, b) => a).transform(levelTransformer).transform(searchTransformer),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
