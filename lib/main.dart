import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'pages/home/home_page.dart';

// Sets a platform override for desktop to avoid exceptions. See
// https://flutter.dev/desktop#target-platform-override for more info.
void _enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

void main() {
  _enablePlatformOverrideForDesktop();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IIT-JEE Notes by Ayush P Gupta',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Nunito',
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          textTheme: Theme.of(context).textTheme,
          iconTheme: IconThemeData(
            color: Colors.blueGrey[900],
            size: 20,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
