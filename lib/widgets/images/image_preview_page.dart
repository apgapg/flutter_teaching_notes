import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImagePreviewPage extends StatelessWidget {
  final String url;

  ImagePreviewPage({this.url});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        invertColors:
            MediaQuery.of(context).platformBrightness == Brightness.dark
                ? true
                : false,
      ),
      child: PhotoView(
        heroAttributes: PhotoViewHeroAttributes(tag: url),
        imageProvider: CachedNetworkImageProvider(
          url,
        ),
        initialScale: kIsWeb ? 1.0 : null,
      ),
    );
  }
}
