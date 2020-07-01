import 'package:flutter/material.dart';
import 'package:flutter_teaching_notes/utils/top_level_utils.dart';
import 'package:flutter_teaching_notes/widgets/images/my_image.dart';

class NoteCard extends StatelessWidget {
  final String url;

  final int index;

  NoteCard(this.index, this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blueGrey[100],
                width: 1.0,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
              child: MyImage(url),
            ),
          ),
          Positioned(
            bottom: 4.0,
            child: Text(
              "©ayushpgupta",
              style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.blueGrey[500].withOpacity(0.7)),
            ),
          ),
          Positioned(
            bottom: 6.0,
            right: 6.0,
            child: Container(
              height: 18.0,
              width: 18.0,
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.black26),
              child: Text(
                (index + 1).toString(),
                style: TextStyle(fontSize: 10.0, color: Colors.white),
              ),
            ),
          ),
          if (isDebugMode) Positioned.fill(top: 0, child: Text(url))
        ],
      ),
    );
  }
}

class NetworkImageError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Icon(
        Icons.broken_image,
        size: 32.0,
        color: Colors.blueGrey[500].withOpacity(0.3),
      ),
    );
  }
}
