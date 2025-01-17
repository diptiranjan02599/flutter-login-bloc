import 'dart:async';
import 'package:flutter/foundation.dart';

import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // Add Data To Stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Check Data From Stream
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);
  Stream<bool> get submitValid => CombineLatestStream.combine2(email, password, (email, password) => true);

  submit() {
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;

    print('Email - $validEmail');
    print('Password - $validPassword');
  }


  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}