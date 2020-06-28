import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImagePreviewPage extends StatelessWidget {
  final String url;

  ImagePreviewPage({this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PhotoView(
        heroAttributes: PhotoViewHeroAttributes(tag: url),
        imageProvider: CachedNetworkImageProvider(
          url,
        ),
        initialScale: 1.0,
      ),
    );
  }
}
