import 'package:flutter/material.dart';
import 'package:flutter_teaching_notes/model/course_model.dart';
import 'package:flutter_teaching_notes/widgets/note_card.dart';
import 'package:flutter_teaching_notes/widgets/responsive_container.dart';
import 'package:url_launcher/url_launcher.dart';

class CoursePage extends StatefulWidget {
  final CourseItem item;

  CoursePage(this.item);

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _notifier = ValueNotifier<List<String>>([]);

  List<String> list;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 2.0,
        title: Text(widget.item?.name ?? "NA"),
        actions: <Widget>[
          Tooltip(
            message: "Download PDF",
            child: IconButton(
              icon: Icon(Icons.arrow_downward),
              onPressed: onDownloadTap,
            ),
          )
        ],
      ),
      body: ResponsiveContainer(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView.builder(
          padding: EdgeInsets.symmetric(
            vertical: 4.0,
            horizontal: 2.0,
          ),
          // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, childAspectRatio: 1.5),
          itemBuilder: (context, index) {
            return NoteCard(index, list[index]);
          },
          itemCount: list.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.videocam),
        onPressed: () async {
          if (await canLaunch(widget.item.videoLink)) {
            await launch(widget.item.videoLink);
          }
        },
      ),
    );
  }

  Future<void> init() async {
    final list1 = widget.item.notes
        .map((item) =>
            NotesItem(item.name.split("/").last.split('.')[0], item.url))
        .where((item) =>
            item.name != null &&
            item.name.isNotEmpty &&
            item.url != null &&
            item.url.isNotEmpty)
        .toList();
    list1.sort((a, b) => int.parse(a.name).compareTo(int.parse(b.name)));
    this.list = list1.map((item) => item.url).toList();
  }

  void onDownloadTap() async {
    if (await canLaunch(widget.item?.pdfLink)) {
      await launch(widget.item.pdfLink);
    } else
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text("Download not available. Check back later"),
        ),
      );
  }

  void addUrl(url) {
    final list = <String>[]..addAll(_notifier.value);
    list.add(url);
    _notifier.value = list;
  }
}
