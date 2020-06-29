import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_teaching_notes/widgets/primary_raised_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ReviewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 150,
          child: Image.asset('assets/images/review.png'),
        ),
        ListTile(
          title: Text(
            "Help us to improve!",
          ),
          subtitle: Text(
            "Your feedback matters. Let us know what you think about our app "
            "and provide us your valuable suggestions.",
          ),
        ),
        PrimaryRaisedButton(
          icon: Icons.star,
          text: ("RATE US"),
          onTap: () {
            launch('https://play.google.com/store/apps/'
                'details?id=com.coddu.flutter.iitjee.notes');
          },
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
