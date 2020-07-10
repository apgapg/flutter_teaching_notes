import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_teaching_notes/model/course_model.dart';
import 'package:flutter_teaching_notes/utils/log_utils.dart';
import 'package:flutter_teaching_notes/utils/top_level_utils.dart';
import 'package:flutter_teaching_notes/widgets/border_container.dart';
import 'package:flutter_teaching_notes/widgets/images/my_image.dart';
import 'package:flutter_teaching_notes/widgets/my_divider.dart';
import 'package:flutter_teaching_notes/widgets/pdf_widget.dart';
import 'package:flutter_teaching_notes/widgets/primary_raised_button.dart';
import 'package:flutter_teaching_notes/widgets/responsive_container.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:url_launcher/url_launcher.dart';

class TopicPage extends StatefulWidget {
  final Topic item;
  final CourseItem course;

  TopicPage(this.item, this.course);

  @override
  _TopicPageState createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  String _pdfPath;

  @override
  void initState() {
    super.initState();
    getpdf();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      child: Scaffold(
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
              if (checkIfNotEmpty(_pdfPath))
                BorderContainer(
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: PdfWidget(_pdfPath),
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
                      MyDivider(),
                      MyImage(
                        image,
                        tapEnabled: true,
                      ),
                      MyDivider(),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
            ],
          ),
        ),
      ),
    );
  }

  void getpdf() async {
    try {
      final storageReference = FirebaseStorage().ref().child(
          'chapter-pdf/${widget.course.name}/${widget.item.title.replaceAll('Quality Numerical ', '')} ${widget.item.id}.pdf');
      final path = await storageReference.getDownloadURL();
      print(path);
      if (mounted) {
        setState(() {
          _pdfPath = path;
        });
      }
    } catch (e, s) {
      logger.e(s, s);
    }
  }
}
