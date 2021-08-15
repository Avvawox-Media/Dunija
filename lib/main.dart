
import 'package:dunija/dunija.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dunija/injection_container.dart' as ic;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Initialize firebase App
  await Firebase.initializeApp();

  //Inject Dependencies
  await ic.init();

  runApp(Dunija());
}

