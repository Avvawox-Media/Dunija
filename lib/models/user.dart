import 'package:flutter/material.dart';

class User {
  final firstName, lastName, dob, gender, bio, interest;

  User(
      {@required this.firstName,
      @required this.lastName,
      @required this.dob,
      @required this.bio,
      @required this.gender,
      @required this.interest});
}
