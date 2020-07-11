import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BorderContainer extends StatelessWidget {
  final EdgeInsets padding;

  final EdgeInsets margin;

  BorderContainer({
    this.child,
    this.padding,
    this.margin,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: Card(
        elevation: 0,
        child: child,
        color: Theme.of(context).cardColor,
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
