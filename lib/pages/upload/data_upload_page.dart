import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_teaching_notes/di/injector.dart';
import 'package:flutter_teaching_notes/model/course_model.dart';
import 'package:flutter_teaching_notes/modules/questions/models/question_model.dart';
import 'package:flutter_teaching_notes/utils/log_utils.dart';
import 'package:flutter_teaching_notes/utils/toast_utils.dart';
import 'package:flutter_teaching_notes/utils/top_level_utils.dart';
import 'package:flutter_teaching_notes/widgets/primary_raised_button.dart';
import 'package:http/http.dart' as http;
import 'package:web_scraper/web_scraper.dart';

class DataUploadPage extends StatefulWidget {
  @override
  _DataUploadPageState createState() => _DataUploadPageState();
}

class _DataUploadPageState extends State<DataUploadPage> {
  @override
  void initState() {
    super.initState();
    //init2();
    //initCoverImageCopy();
    //initCourseScrap();
    //initSolutionsImageCopy();
    //initImageUrlsOfChapter(chapterId: "M5KOIVB52U4RBO9YVCMY");
    //initCourseImagesScrap();
    initCourseChaptersScrap();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PrimaryRaisedButton(
          text: "Refresh",
          onTap: () {
            // initChapterScrap();
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

  Future<void> initCoverImageCopy() async {
    final firestore = Firestore.instance;

    final doc = await firestore.collection('numericals').getDocuments();

    doc.documents.forEach((element) async {
      final q = Question.fromJson(element.data);
      logger.d(element.documentID);
      logger.d(q.title);
      final newImages = <String>[];
      for (final image in q.images) {
        final rawfile = await DefaultCacheManager().getSingleFile(image);

        final StorageReference storageReference = FirebaseStorage().ref().child(
            '${q.subject}/${q.topic}/${element.documentID}/question_${q.images.indexOf(image)}.jpeg');
        final uploadTask = storageReference.putFile(rawfile);
        await uploadTask.onComplete;
        logger.d('File Uploaded');
        final imageurl = await storageReference.getDownloadURL();
        newImages.add(imageurl);
      }
      if (checkIfListIsNotEmpty(newImages)) {
        await element.reference.updateData({'images': newImages});
        logger.d("Updated ${element.documentID}");
      } else {
        throw Exception("newImages cannot be empty");
      }
    });
  }

  Future<void> initSolutionsImageCopy() async {
    final firestore = Firestore.instance;

    final doc = await firestore.collection('numericals').getDocuments();

    doc.documents.sublist(115, 126).forEach((element) async {
      await Future.delayed(Duration(milliseconds: 500));
      final q = Question.fromJson(element.data);
      logger.d(element.documentID);
      logger.d(q.title);
      if (q.solutions?.elementAt(0)?.images?.isNotEmpty ?? false) {
        final newImages = <String>[];
        for (final image in q.solutions.elementAt(0).images) {
          try {
            final rawfile = await DefaultCacheManager().getSingleFile(image);
            final StorageReference storageReference = FirebaseStorage().ref().child(
                '${q.subject}/${q.topic}/${element.documentID}/solution_${q.solutions.elementAt(0).images.indexOf(image)}.jpeg');
            final uploadTask = storageReference.putFile(rawfile);
            await uploadTask.onComplete;
            logger.d('File Uploaded');
            final imageurl = await storageReference.getDownloadURL();
            newImages.add(imageurl);
          } catch (e, s) {
            logger.e(e, s);
          }
        }
        if (checkIfListIsNotEmpty(newImages)) {
          logger.d(newImages);
          final soln = q.solutions[0];
          final newSoln = soln.copyWith(images: newImages);
          await element.reference.updateData({
            'solutions': [newSoln.toJson()]
          });
          logger.d("Updated ${element.documentID}");
        } else {
          throw Exception("newImages cannot be empty");
        }
      } else {
        return;
      }
    });
  }

  Future<void> initChapterScrap({String chapterUrl}) async {
    final level = 2;
    final subject = "Physics";
    final topic = "Projectile Motion";
    final rawUrl = chapterUrl;

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
        'https://unacademy.com/course/projectile-motion-for-iit-jee/AF1MBSF6';

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
    }
  }

  Future<List<int>> initImageUrlsOfChapter({String chapterId}) async {
    final eventUrl =
        "https://player.uacdn.net/lesson-raw/$chapterId/events-data.json";
    /* final metaDataUrl =
        "https://player.uacdn.net/lesson-raw/M5KOIVB52U4RBO9YVCMY/meta.json";*/
    final eventRes = await http.get(eventUrl);
    //final metaRes = await http.get(metaDataUrl);
    if (eventRes.statusCode == 200) {
      final event = jsonDecode(eventRes.body) as List;
      //final meta = jsonDecode(metaRes.body);
      //print(event);
      // print(meta);

      /*  final imagesList = (meta['image_clips']['mapping'] as Map)
          .values
          .map((e) => (e as Map).keys)
          .toList();*/
      //print(imagesList);
      final seqList = event
          .where((e) => (e as Map).containsKey('i'))
          .map((e) => e['i'] as int)
          .toList();
      print(seqList.toSet());
      return seqList.toSet().toList();
    }
  }

  Future<void> initCourseImagesScrap() async {
    final courseName = 'Gravitation';
    final courseDesc =
        "This course deals with the theory behind the Gravitation chapter. The contents include Gravitation Law, Gravitational Field, Kepler Law, Motion of Satellites along with quality numerical";
    final courseId = 'D5A8YSAJ';
    final rawUrl =
        'https://unacademy.com/course/gravitation-for-iit-jee/D5A8YSAJ';

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
        listUrls.add(url);
      });
      final chapterImages = <String>[];
      for (final suburl in listUrls) {
        await Future.delayed(Duration(milliseconds: 1000));
        final uid = await initChapterUidScrap(
            chapterUrl: 'https://unacademy.com$suburl');
        final imagesIdList = await initImageUrlsOfChapter(chapterId: uid);
        final imagesList = imagesIdList
            .map((e) => 'https://edge.uacdn.net/$uid/images/$e.jpeg')
            .toList();
        chapterImages.addAll(imagesList);
      }
      print(chapterImages);
      await Firestore.instance.collection('courses').document(courseId).setData(
        {
          'name': '$courseName',
          'topic': '$courseName',
          'subject': 'Physics',
          'description': '$courseDesc',
          'videoLink': '$rawUrl',
          'notes': [],
          'images': chapterImages,
          'cover': 'https://edge.uacdn.net/M5KOIVB52U4RBO9YVCMY/images/4.jpeg',
          'createdAt': DateTime.now().millisecondsSinceEpoch,
        },
        merge: true,
      );
      ToastUtils.showToast("Added $rawUrl successfully!");
    }
  }

  Future<String> initChapterUidScrap({String chapterUrl}) async {
    final rawUrl = chapterUrl;
    final webScraper = WebScraper('https://unacademy.com');
    if (await webScraper
        .loadWebPage(rawUrl.replaceAll(r'https://unacademy.com', ''))) {
      List<Map<String, dynamic>> elements2 = webScraper
          .getElement('div.FreeLessonFrame__InnerDiv-ef4326-2', ['data-url']);
      final uuid = elements2[0]['attributes']['data-url']
          .toString()
          .replaceAll(
              r'https://player.uacdn.net/lesson-raw/player/v585/player-min.html?uuid=',
              '')
          .replaceAll(r'&use_imgix=1', '');

      print(uuid);

      return uuid;
    }
  }

  void initCourseChaptersScrap() async {
    final rawUrl =
        'https://unacademy.com/course/thermodynamics-for-iit-jee-138/P4H68HSQ';

    //
    //

    final webScraper = WebScraper('https://unacademy.com');
    if (await webScraper
        .loadWebPage(rawUrl.replaceAll(r'https://unacademy.com', ''))) {
      List<Map<String, dynamic>> elements = webScraper.getElement(
          'div.Week__Wrapper-sc-1qeje5a-2 > a.Link__StyledAnchor-sc-1n9f3wx-0',
          ['href']);
      List<Map<String, dynamic>> titleElements = webScraper.getElement(
          'div.Week__Wrapper-sc-1qeje5a-2 > a.Link__StyledAnchor-sc-1n9f3wx-0 > div.ItemCard__ItemInfo-xrh60s-1 > h6.H6-sc-1gn2suh-0',
          []);
      print(titleElements);
      final listUrls = <String>[];
      final titleUrls = <String>[];
      elements.forEach((element) {
        final url = element['attributes']['href'];
        print(url);
        listUrls.add('https://unacademy.com$url');
      });
      titleElements.forEach((element) {
        final title = element['title'];
        print(title);
        titleUrls.add('$title');
      });
      final document = await injector<Firestore>()
          .document('courses/${rawUrl.split('/').last}')
          .get();
      final course = CourseItem.fromJson(document.data);
      final topics = [];

      for (final url in listUrls) {
        await Future.delayed(Duration(seconds: 2));
        final uid = await initChapterUidScrap(chapterUrl: url);
        topics.add({
          'id': uid,
          'title': titleUrls[listUrls.indexOf(url)],
          'images': course.images
              .where((element) => element.contains('$uid'))
              .toList(),
          'video': '$url'
        });
      }
      await document.reference.setData(
        {
          'topics': topics,
        },
        merge: true,
      );
      /*   listUrls.forEach((element) async {
        //await initChapterScrap(chapterUrl: 'https://unacademy.com' + element);
      });*/
    }
  }
}
