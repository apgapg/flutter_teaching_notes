import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String text;

  ErrorPage(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}
