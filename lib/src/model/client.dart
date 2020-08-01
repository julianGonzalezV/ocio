import 'package:flutter/material.dart';
import 'package:ocio/src/model/contact.dart';

@immutable
class Client {
  final String idType;
  final String idNumber;
  final String gender;
  final String firstName;
  final String secondName;
  final String firstLastName;
  final String secondLastName;
  final String birthdate;
  final Contact contact;

  Client(
    this.idType,
    this.idNumber,
    this.gender,
    this.firstName,
    this.secondName,
    this.firstLastName,
    this.secondLastName,
    this.birthdate,
    this.contact,
  );

  Client copyWith({
    String idType,
    String idNumber,
    String gender,
    String firstName,
    String secondName,
    String firstLastName,
    String secondLastName,
    String birthdate,
    Contact contact,
  }) {
    return Client(
      idType ?? this.idType,
      idNumber ?? this.idNumber,
      gender ?? this.gender,
      firstName ?? this.firstName,
      secondName ?? this.secondName,
      firstLastName ?? this.firstLastName,
      secondLastName ?? this.secondLastName,
      birthdate ?? this.birthdate,
      contact ?? this.contact,
    );
  }

  @override
  int get hashCode =>
      idNumber.hashCode ^
      idType.hashCode ^
      gender.hashCode ^
      firstName.hashCode ^
      firstLastName.hashCode ^
      birthdate.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Client && idType == other.idType && idNumber == other.idNumber;

  @override
  String toString() {
    return '{idNumber: $idNumber, idType: $idType, gender: $gender,'
        'firstName: $firstName, secondName: $secondName,'
        'firstLastName: $firstLastName, secondLastName: $secondLastName,'
        'birthdate: $birthdate, contact: ${contact.toString()}}';
  }
}
