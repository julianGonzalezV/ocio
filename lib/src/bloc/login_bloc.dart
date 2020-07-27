import 'dart:async';

import 'package:ocio/src/bloc/validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validator {
  /// Broadcast for allowing multiple instances to see the changes
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // reference call
  Function(String) get changeEmail {
    return _emailController.sink.add;
  }

  Function(String) get changePassword {
    return _passwordController.sink.add;
  }

  /// Allow to listen the every stream
  Stream<String> get emailStream {
    return _emailController.stream.transform(emailValidation);
  }

  Stream<String> get passwordStream {
    return _passwordController.stream.transform(passwordValidation);
  }

  Stream<bool> get formValidStream => Rx.combineLatest2(
      emailStream,
      passwordStream,
      (e, p) => true); //if exists data in e & b then return true

//Get last/full value from every input text

  String get emailValue => _emailController.value;
  String get passwordValue => _passwordController.value;

  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}
