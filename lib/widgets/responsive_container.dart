import 'package:flutter/material.dart';
import 'package:flutter_teaching_notes/widgets/primary_raised_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ResponsiveContainer extends StatelessWidget {
  final Widget child;

  ResponsiveContainer({
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (MediaQuery.of(context).size.width >= 1300) Spacer(),
          ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width >= 900
                    ? 900
                    : MediaQuery.of(context).size.width),
            child: Container(
              child: child,
              decoration: MediaQuery.of(context).size.width >= 900
                  ? BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          color: Colors.grey[200],
                          width: 4,
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          if (MediaQuery.of(context).size.width >= 1300)
            Expanded(
              child: Scaffold(
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 150,
                      child: Image.asset('assets/images/review.png'),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Have Feedback?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Reach us out at our support",
                      style: TextStyle(),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PrimaryRaisedButton(
                          text: " Send Mail ".toUpperCase(),
                          onTap: () {
                            launch('mailto:ayushpguptaapg@gmail.com?'
                                    'subject=Feedback'
                                    '&body=Hello Team,%0A%0AGreetings of the ' +
                                'day%0A%0A...%0A%0ARegards,%0A---');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
