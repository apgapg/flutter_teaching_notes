import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class PdfWidget extends StatelessWidget {
  final String url;

  PdfWidget(this.url);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 8,
        ),
        ListTile(
          title: Text(
            "Download as PDF",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          isThreeLine: true,
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Save a copy of this question on your device",
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    launch(url);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 4.0,
                          ),
                          child: Icon(
                            FontAwesomeIcons.solidFilePdf,
                            size: 18,
                            color: Colors.red[700],
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Save PDF",
                          style: Theme.of(context).textTheme.headline4.copyWith(
                                fontSize: 14,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
