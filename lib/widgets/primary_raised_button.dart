import 'package:flutter/material.dart';
import 'package:flutter_teaching_notes/utils/top_level_utils.dart';

class PrimaryRaisedButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;
  final Color textColor;
  final IconData icon;

  PrimaryRaisedButton({
    @required this.text,
    @required this.onTap,
    this.color,
    this.textColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return icon != null
        ? RaisedButton.icon(
            icon: Icon(
              icon,
              size: 20,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            color: color ?? Theme.of(context).primaryColor,
            textColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 8,
            ),
            onPressed: onTap,
            label: Text(
              checkIfNotEmpty(text) ? text : 'NA',
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          )
        : RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            color: color ?? Theme.of(context).primaryColor,
            textColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 8,
            ),
            onPressed: onTap,
            child: Text(
              checkIfNotEmpty(text) ? text : 'NA',
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          );
  }
}
