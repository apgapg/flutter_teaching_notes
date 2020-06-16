import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          final list = snapshot.data.documents
              .map((document) => Question.fromJson(document.data))
              .toList();

          return ListView(
            padding: EdgeInsets.symmetric(vertical: 4),
            children: [
              ...list.map((e) => QuestionCard(e)),
            ],
          );
        } else if (snapshot.hasError) {
          return ErrorPage(snapshot.error.toString());
        } else {
          return LoadingPage();
        }
      },
      stream: Firestore.instance.collection('numericals').snapshots(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
