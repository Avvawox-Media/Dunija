import 'package:flutter/material.dart';

class User {
  final firstName, lastName, dob, gender, bio, interest;

  User(
      {@required this.firstName,
      @required this.lastName,
      this.dob,
      this.bio,
      this.gender,
      this.interest});
}
