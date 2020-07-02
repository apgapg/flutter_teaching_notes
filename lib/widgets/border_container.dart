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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
      ),
      child: child,
      clipBehavior: Clip.antiAlias,
    );
  }
}
