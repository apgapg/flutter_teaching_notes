import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static void showProgressBar(BuildContext context, {String text}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => WillPopScope(
        onWillPop: () async => false,
        child: Dialog(
          child: Container(
            height: 80,
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).accentColor),
                    strokeWidth: 1.5,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Text(
                      text ?? "Loading...",
                      style: TextStyle(fontSize: 14),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget showCircularProgressBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).accentColor),
          strokeWidth: 1.5,
        ),
      ),
    );
  }

  static void hideProgressBar(context) {
    if (context != null)
      Navigator.pop(context);
    else {
      print("Provided context is null");
    }
  }

  static void onLogoutPress(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          "Logout",
        ),
        content: Text("Are you sure you want to logout?"),
        actions: <Widget>[
          CupertinoButton(
            onPressed: () {
              //ApplicationBloc().logout();
            },
            child: Text('Yes'),
          ),
          CupertinoButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
        ],
      ),
    );
  }
}
