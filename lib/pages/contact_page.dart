import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,

        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("About Me"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            ),
          ),
          elevation: 2.0,
          child: Stack(
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Material(
                      elevation: 8.0,
                      shape: CircleBorder(),
                      color: Colors.transparent,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                        radius: 44.0,
                      ),
                    ),
                    SizedBox(
                      height: 28.0,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "+91-8218135689",
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                      mainAxisSize: MainAxisSize.min,
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "ayushpguptaapg@gmail.com",
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                      mainAxisSize: MainAxisSize.min,
                    ),
                    SizedBox(
                      height: 48.0,
                    ),
                    Row(
                      children: <Widget>[
                        CircularButton(FontAwesomeIcons.mediumM, "https://medium.com/@ayushpguptaapg"),
                        HorizontalSpacing(),
                        CircularButton(FontAwesomeIcons.instagram, "https://www.instagram.com/ayushpgupta/"),
                        HorizontalSpacing(),
                        CircularButton(FontAwesomeIcons.github, "https://github.com/apgapg"),
                      ],
                      mainAxisSize: MainAxisSize.min,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      children: <Widget>[
                        CircularButton(FontAwesomeIcons.facebookF, "https://www.facebook.com/ayushpgupta"),
                        HorizontalSpacing(),
                        CircularButton(FontAwesomeIcons.googlePlusG, "https://medium.com/@ayushpguptaapg"),
                      ],
                      mainAxisSize: MainAxisSize.min,
                    ),
                    SizedBox(
                      height: 48.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        _launchURL("https://unacademy.com/user/ayushpgupta");
                      },
                      child: Text(
                        "https://unacademy.com/user/ayushpgupta",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class HorizontalSpacing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32.0,
    );
  }
}

class CircularButton extends StatefulWidget {
  final IconData iconData;

  final String url;

  CircularButton(this.iconData, this.url);

  @override
  CircularButtonState createState() {
    return new CircularButtonState();
  }
}

class CircularButtonState extends State<CircularButton> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    final Animation curve = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    animation = Tween(begin: 4.0, end: 0.0).animate(curve);

    controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future.delayed(Duration(seconds: 1));
        if (controller != null) {
          controller.reset();
          controller.forward();
        }
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: animation.value),
      height: 40.0,
      child: FloatingActionButton(
        heroTag: Uuid().v1(),
        onPressed: () {
          _launchURL(widget.url);
        },
        mini: true,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: animation.value),
          child: Icon(
            widget.iconData,
            color: Theme.of(context).primaryColor,
          ),
        ),
        backgroundColor: Colors.white.withOpacity(0.9),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
