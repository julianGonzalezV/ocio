import 'package:flutter/material.dart';

@immutable
class Contact {
  final String address;
  final String cellphone;
  final String email;

  Contact(this.address, this.cellphone, this.email);

  @override
  String toString() {
    return '{address: $address, cellphone: $cellphone, email: $email}';
  }
}
