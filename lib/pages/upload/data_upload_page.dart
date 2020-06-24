import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_teaching_notes/utils/toast_utils.dart';
import 'package:flutter_teaching_notes/widgets/primary_raised_button.dart';
import 'package:web_scraper/web_scraper.dart';

class DataUploadPage extends StatefulWidget {
  @override
  _DataUploadPageState createState() => _DataUploadPageState();
}

class _DataUploadPageState extends State<DataUploadPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //init();

    //init2();
    initCourseScrap();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PrimaryRaisedButton(
          text: "Refresh",
          onTap: () {
            initChapterScrap();
          },
        ),
      ),
    );
  }

/*
  void init() async {
    final id = "NQPJSDY6PN8K4BQNADOE";
    final title = "007 : Backward Slipping";
    final level = 2;
    final subject = "Physics";
    final topic = "Rotational Mechanics";
    final video =
        "https://unacademy.com/lesson/quality-numerical-007-backward-slipping/7WOZS84E";

    //

    //
    //
    //
    final firestore = Firestore.instance;

    final doc =
        await firestore.collection('numericals').document(id.toString()).get();
    if (doc != null && doc.exists) {
      debugPrint("Document $id already exist!");
      return;
    } else {
      final value = await firestore
          .collection('numericals')
          .document(id.toString())
          .setData({
        'title': title,
        'level': level,
        'subject': subject,
        'topic': topic,
        'images': ['https://edge.uacdn.net/$id/images/2.jpeg'],
        'solutions': [
          {
            'images': [
              for (int i = 3; i < 12; i++)
                'https://edge.uacdn.net/$id/images/$i.jpeg'
            ],
            'video': video,
          }
        ],
        'createdAt': DateTime.now().millisecondsSinceEpoch,
      }, merge: true);
    }
  }
*/

  Future<void> initChapterScrap({String chapterUrl}) async {
    final level = 2;
    final subject = "Physics";
    final topic = "Simple Harmonic Motion";
    final rawUrl = chapterUrl ??
        'https://unacademy.com/lesson/quality-numerical-009-interference-of-sound-waves/2WAY15Y2';

    //
    //

    final webScraper = WebScraper('https://unacademy.com');
    if (await webScraper
        .loadWebPage(rawUrl.replaceAll(r'https://unacademy.com', ''))) {
      List<Map<String, dynamic>> elements = webScraper.getElement('h3', []);

      final rawtitle =
          elements[0]['title'].toString().replaceAll(r'Quality Numerical ', '');

      List<Map<String, dynamic>> elements2 = webScraper
          .getElement('div.FreeLessonFrame__InnerDiv-ef4326-2', ['data-url']);
      final uuid = elements2[0]['attributes']['data-url']
          .toString()
          .replaceAll(
              r'https://player.uacdn.net/lesson-raw/player/v585/player-min.html?uuid=',
              '')
          .replaceAll(r'&use_imgix=1', '');

      print(rawtitle);
      print(uuid);

      final id = uuid;
      final title = rawtitle;

      final video = rawUrl;

      final firestore = Firestore.instance;

      final doc = await firestore
          .collection('numericals')
          .document(id.toString())
          .get();
      if (doc != null && doc.exists) {
        debugPrint("Document $id already exist!");
        ToastUtils.showToast("Document $id already exist!");
        return;
      } else {
        final value = await firestore
            .collection('numericals')
            .document(id.toString())
            .setData(
          {
            'title': title,
            'level': level,
            'subject': subject,
            'topic': topic,
            'images': ['https://edge.uacdn.net/$id/images/2.jpeg'],
            'solutions': [
              {
                'images': [
                  //for (int i = 3; i < 12; i++)
                  for (int i = 0; i < 12; i++)
                    'https://edge.uacdn.net/$id/images/$i.jpeg'
                ],
                'video': video,
              }
            ],
            'createdAt': DateTime.now().millisecondsSinceEpoch,
          },
          merge: true,
        );
        ToastUtils.showToast("Added $id successfully!");
      }
    }
  }

  void initCourseScrap() async {
    final rawUrl =
        'https://unacademy.com/course/simple-harmonic-motion-for-iit-jee/8U80RYEN';

    //
    //

    final webScraper = WebScraper('https://unacademy.com');
    if (await webScraper
        .loadWebPage(rawUrl.replaceAll(r'https://unacademy.com', ''))) {
      List<Map<String, dynamic>> elements = webScraper.getElement(
          'div.Week__Wrapper-sc-1qeje5a-2 > a.Link__StyledAnchor-sc-1n9f3wx-0',
          ['href']);
      final listUrls = <String>[];
      elements.forEach((element) {
        final url = element['attributes']['href'];
        print(url);
        if (url.toString().contains('quality-numerical')) listUrls.add(url);
      });
      listUrls.forEach((element) async {
        await initChapterScrap(chapterUrl: 'https://unacademy.com' + element);
      });

      /*  final rawtitle =
          elements[0]['title'].toString().replaceAll(r'Quality Numerical ', '');

      List<Map<String, dynamic>> elements2 = webScraper
          .getElement('div.FreeLessonFrame__InnerDiv-ef4326-2', ['data-url']);
      final uuid = elements2[0]['attributes']['data-url']
          .toString()
          .replaceAll(
              r'https://player.uacdn.net/lesson-raw/player/v585/player-min.html?uuid=',
              '')
          .replaceAll(r'&use_imgix=1', '');

*/

    }
  }
}
