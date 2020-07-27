import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ocio/src/bloc/login_bloc.dart';
export 'package:ocio/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget {
  static Provider _currentInstance;

  factory Provider({Key key, Widget child}) {
    if (_currentInstance == null)
      _currentInstance = new Provider._internal(key: key, child: child);
    return _currentInstance;
  }

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  final loginBloc = new LoginBloc();

  //Provider({Key key, Widget child}) : super(key: key, child: child);

  /// It says the when an update operation happens then it should notify to its children
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    /// search the provider instance inside context
    return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
    //return ( context.inheritFromWidgetOfExactType(Provider) as Provider ).loginBloc;
  }
}
