# flutter_teaching_notes

### Flutter📱 + Firebase🔥

A Flutter project containing questions/answers and notes of IIT JEE preparation prepared by Ayush P Gupta.

These notes are published as video on Unacademy platform.

This app serves the slides/notes used in those videos.

Playstore App: [https://play.google.com/store/apps/details?id=com.coddu.flutter.iitjee.notes](https://play.google.com/store/apps/details?id=com.coddu.flutter.iitjee.notes)

Website: [https://apgapg.github.io/flutter_teaching_notes/](https://apgapg.github.io/flutter_teaching_notes/)

<img src="https://raw.githubusercontent.com/apgapg/flutter_teaching_notes/master/res/s1.png"  height = "400" alt="iitjee"> <img src="https://raw.githubusercontent.com/apgapg/flutter_teaching_notes/master/res/s2.png"  height = "400" alt="iitjee"> <img src="https://raw.githubusercontent.com/apgapg/flutter_teaching_notes/master/res/s3.png"  height = "400" alt="iitjee"> <img src="https://raw.githubusercontent.com/apgapg/flutter_teaching_notes/master/res/s4.png"  height = "400" alt="iitjee"> <img src="https://raw.githubusercontent.com/apgapg/flutter_teaching_notes/master/res/s5.png"  height = "400" alt="iitjee">

## Auto deploy to gh-pages and Firebase Hosting

This repo uses Github action CI/CD whose workflow file can be seen below

[https://gist.github.com/apgapg/76e5c251daa7ce53291164479f43e61c](https://gist.github.com/apgapg/76e5c251daa7ce53291164479f43e61c)

<img src="https://raw.githubusercontent.com/apgapg/flutter_teaching_notes/master/res/c1.png"  height = "500" alt="github">

## Extras

Building Android app bundle 

```flutter clean && flutter build appbundle```

Building json

```flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs```
