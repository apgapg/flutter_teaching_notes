import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_teaching_notes/model/course_model.dart';
import 'package:flutter_teaching_notes/utils/top_level_utils.dart';
import 'package:flutter_teaching_notes/widgets/images/my_image.dart';
import 'package:flutter_teaching_notes/widgets/my_divider.dart';
import 'package:flutter_teaching_notes/widgets/primary_raised_button.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:url_launcher/url_launcher.dart';

class TopicPage extends StatefulWidget {
  final Topic item;

  TopicPage(this.item);

  @override
  _TopicPageState createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text(widget.item?.title ?? "NA"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (!kIsWeb)
              HtmlWidget(
                '''<iframe src='https://player.uacdn.net/lesson-raw/player/v585/player-min.html?uuid=${widget.item.id}&use_imgix=1&autoPlay=false&debug=false'></iframe>''',
                webView: true,
              ),
            if (checkIfNotEmpty(widget.item.video))
              Container(
                margin: EdgeInsets.only(
                  bottom: 8,
                  top: 8,
                ),
                child: PrimaryRaisedButton(
                  icon: Icons.videocam,
                  color: Colors.green,
                  text: "UNACADEMY VIDEO",
                  onTap: () async {
                    if (await canLaunch(widget.item.video)) {
                      await launch(widget.item.video);
                    }
                  },
                ),
              ),
            if (checkIfListIsNotEmpty(widget.item.images))
              for (final image in widget.item.images)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isDebugMode)
                      Text(
                        image,
                        style: TextStyle(fontSize: 12),
                      ),
                    MyImage(
                      image,
                      tapEnabled: true,
                    ),
                    MyDivider(),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}
