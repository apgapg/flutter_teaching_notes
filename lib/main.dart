import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_teaching_notes/utils/top_level_utils.dart';
import 'package:google_fonts/google_fonts.dart';

import 'di/injector.dart';
import 'pages/home/home_page.dart';

// Sets a platform override for desktop to avoid exceptions. See
// https://flutter.dev/desktop#target-platform-override for more info.
void _enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  _enablePlatformOverrideForDesktop();
  if (isDebugMode) {
    await FirebaseAnalytics().setAnalyticsCollectionEnabled(false);
  }
  await Injector().init();

  runApp(MyApp());
}

FirebaseAnalytics analytics = FirebaseAnalytics();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IIT-JEE Notes by Ayush P Gupta',
      builder: (context, widget) {
        ErrorWidget.builder = (errorDetails) {
          return buildError(context, errorDetails);
        };
        final botToastBuilder = BotToastInit();
        final myWidget = botToastBuilder(context, widget);
        return myWidget;
      },
      navigatorObservers: [
        BotToastNavigatorObserver(),
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.notoSansTextTheme(
          Theme.of(context).textTheme,
        ),
        bottomAppBarColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          unselectedIconTheme: IconThemeData(
            color: Colors.black87,
          ),
          unselectedItemColor: Colors.black87,
        ),
        appBarTheme: AppBarTheme(
          color: Colors.white,
          textTheme: Theme.of(context).textTheme,
          iconTheme: IconThemeData(
            color: Colors.blueGrey[900],
            size: 20,
          ),
        ),
        tabBarTheme: TabBarTheme(
          labelStyle: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
          labelColor: Colors.black87,
        ),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.notoSansTextTheme(
          ThemeData.dark().textTheme,
        ),
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.dark().textTheme,
          iconTheme: IconThemeData(
            size: 20,
          ),
        ),
      ),
      home: HomePage(),
    );
  }

  Widget buildError(BuildContext context, FlutterErrorDetails error) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "--Error Occurred--\n\n${error.exceptionAsString()}",
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
