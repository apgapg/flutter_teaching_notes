import 'package:flutter/material.dart';

class PlaceholderImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      alignment: Alignment.center,
      child: Container(
        height: 24.0,
        width: 24.0,
        child: CircularProgressIndicator(
          strokeWidth: 1.0,
        ),
      ),
    );
  }
}
