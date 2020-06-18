import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 32.0,
            width: 32.0,
            child: CircularProgressIndicator(
              strokeWidth: 1.0,
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          Text("Fetching data...")
        ],
      ),
    );
  }
}
