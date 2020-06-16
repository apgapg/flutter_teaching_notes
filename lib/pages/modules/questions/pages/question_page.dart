import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_teaching_notes/pages/modules/questions/models/question_model.dart';
import 'package:flutter_teaching_notes/utils/top_level_utils.dart';
import 'package:flutter_teaching_notes/widgets/placeholder_image.dart';
import 'package:flutter_teaching_notes/widgets/primary_raised_button.dart';
import 'package:url_launcher/url_launcher.dart';

class QuestionPage extends StatefulWidget {
  final Question item;

  QuestionPage(this.item);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _notifier = ValueNotifier<List<String>>([]);

  List<String> list;

  bool _showSolution = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 2.0,

        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.item?.title ?? "NA"),
        /* actions: <Widget>[
          Tooltip(
            message: "Download PDF",
            child: IconButton(
              icon: Icon(Icons.arrow_downward),
              onPressed: onDownloadTap,
            ),
          )
        ],*/
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (checkIfListIsNotEmpty(widget.item.images))
              for (String image in widget.item.images)
                CachedNetworkImage(
                  fit: BoxFit.contain,
                  imageUrl: image,
                  placeholder: (context, url) => PlaceholderImage(),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                ),
            if (checkIfListIsNotEmpty(widget.item.solutions))
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: PrimaryRaisedButton(
                  icon: Icons.code,
                  color: !_showSolution
                      ? Theme.of(context).primaryColor
                      : Colors.red,
                  text: !_showSolution ? "VIEW SOLUTIONS" : "HIDE SOLUTIONS",
                  onTap: () {
                    setState(() {
                      _showSolution = !_showSolution;
                    });
                  },
                ),
              )
            else
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: PrimaryRaisedButton(
                  icon: Icons.code,
                  text: "NO SOLUTIONS",
                  onTap: null,
                ),
              ),
            if (_showSolution && checkIfListIsNotEmpty(widget.item.solutions))
              for (final soln in widget.item.solutions)
                if (checkIfListIsNotEmpty(soln.images))
                  Column(
                    children: [
                      if (checkIfNotEmpty(soln.video))
                        Container(
                          margin: EdgeInsets.only(bottom: 16),
                          child: PrimaryRaisedButton(
                            icon: Icons.videocam,
                            color: Colors.green,
                            text: "VIDEO SOLUTION",
                            onTap: () async {
                              if (await canLaunch(soln.video)) {
                                await launch(soln.video);
                              }
                            },
                          ),
                        ),
                      for (String image in soln.images)
                        CachedNetworkImage(
                          fit: BoxFit.contain,
                          imageUrl: image,
                          placeholder: (context, url) => PlaceholderImage(),
                          errorWidget: (context, url, error) =>
                              new Icon(Icons.error),
                        ),
                    ],
                  ),
            if (!_showSolution && checkIfListIsNotEmpty(widget.item.solutions))
              Text(
                'It\'s is good if you try solving yourself first.\nRead again and again.',
                style:
                    Theme.of(context).textTheme.display1.copyWith(fontSize: 14),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
