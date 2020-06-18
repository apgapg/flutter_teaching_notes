import 'package:flutter/material.dart';

class MyPopupMenuItem<T> extends PopupMenuItem<T> {
  /// Creates a popup menu item with a checkmark.
  ///
  /// By default, the menu item is [enabled] but unchecked. To mark the item as
  /// checked, set [checked] to true.
  ///
  /// The `checked` and `enabled` arguments must not be null.
  const MyPopupMenuItem({
    Key key,
    T value,
    this.checked = false,
    bool enabled = true,
    Widget child,
  })  : assert(checked != null),
        super(
          key: key,
          value: value,
          enabled: enabled,
          child: child,
        );

  /// Whether to display a checkmark next to the menu item.
  ///
  /// Defaults to false.
  ///
  /// When true, an [Icons.done] checkmark is displayed.
  ///
  /// When this popup menu item is selected, the checkmark will fade in or out
  /// as appropriate to represent the implied new state.
  final bool checked;

  /// The widget below this widget in the tree.
  ///
  /// Typically a [Text]. An appropriate [DefaultTextStyle] is put in scope for
  /// the child. The text should be short enough that it won't wrap.
  ///
  /// This widget is placed in the [ListTile.title] slot of a [ListTile] whose
  /// [ListTile.leading] slot is an [Icons.done] icon.
  @override
  Widget get child => super.child;

  @override
  _CheckedPopupMenuItemState<T> createState() =>
      _CheckedPopupMenuItemState<T>();
}

class _CheckedPopupMenuItemState<T>
    extends PopupMenuItemState<T, MyPopupMenuItem<T>>
    with SingleTickerProviderStateMixin {
  static const Duration _fadeDuration = Duration(milliseconds: 150);
  AnimationController _controller;

  Animation<double> get _opacity => _controller.view;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _fadeDuration, vsync: this)
      ..value = widget.checked ? 1.0 : 0.0
      ..addListener(() => setState(() {
            /* animation changed */
          }));
  }

  @override
  void handleTap() {
    // This fades the checkmark in or out when tapped.
    if (widget.checked)
      _controller.reverse();
    else
      _controller.forward();
    super.handleTap();
  }

  @override
  Widget buildChild() {
    return ListTile(
      dense: true,
      enabled: widget.enabled,
      trailing: FadeTransition(
        opacity: _opacity,
        child: Icon(
          _controller.isDismissed ? null : Icons.done,
          size: 20,
          color: Theme.of(context).primaryColor,
        ),
      ),
      title: widget.child,
    );
  }
}
