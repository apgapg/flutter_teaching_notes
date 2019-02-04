import 'package:flutter/cupertino.dart';
import 'package:flutter_teaching_notes/bloc/home_bloc.dart';

class BlocProvider<T extends BaseBloc> extends InheritedWidget {
  BlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }) : super(key: key);

  final T bloc;
  final Widget child;

  static T of<T extends BaseBloc>(BuildContext context) {
    BlocProvider<T> provider = context.inheritFromWidgetOfExactType(T);
    return provider.bloc;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}
