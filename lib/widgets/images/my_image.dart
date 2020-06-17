import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_teaching_notes/widgets/placeholder_image.dart';

class MyImage extends StatelessWidget {
  final String url;

  MyImage(this.url);

  @override
  Widget build(BuildContext context) {
    return !kIsWeb
        ? CachedNetworkImage(
            fit: BoxFit.contain,
            imageUrl: url,
            placeholder: (context, url) => PlaceholderImage(),
            errorWidget: (context, url, error) => new Icon(Icons.error),
          )
        : Image.network(
            url,
            fit: BoxFit.contain,
          );
  }
}
