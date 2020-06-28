import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_teaching_notes/widgets/placeholder_image.dart';

import 'image_preview_page.dart';

class MyImage extends StatelessWidget {
  final String url;
  final bool tapEnabled;

  MyImage(
    this.url, {
    this.tapEnabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !tapEnabled
          ? null
          : () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ImagePreviewPage(url: url),
                ),
              );
            },
      child: !kIsWeb
          ? CachedNetworkImage(
              fit: BoxFit.contain,
              imageUrl: url,
              placeholder: (context, url) => PlaceholderImage(),
              errorWidget: (context, url, error) => SizedBox(
                height: 0,
              ),
            )
          : Image.network(
              url,
              fit: BoxFit.contain,
            ),
    );
  }
}
