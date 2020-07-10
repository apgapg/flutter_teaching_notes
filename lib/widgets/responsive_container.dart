import 'package:flutter/material.dart';

class ResponsiveContainer extends StatelessWidget {
  final Widget child;

  ResponsiveContainer({
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 900),
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
    );
  }
}
