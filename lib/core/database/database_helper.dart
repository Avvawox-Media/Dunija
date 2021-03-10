import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class DatabaseHelper {
  static Directory _documentsDirectory;

  //Creates a singleton instance of class DatabaseHelper
  DatabaseHelper._instance() {
    if (_documentsDirectory == null) initDatabase();
  }

  static final DatabaseHelper instance = DatabaseHelper._instance();

  Future<void> initDatabase() async {
    ///Gets a platform specific path where database would recide
    _documentsDirectory = await path_provider.getApplicationSupportDirectory();

    try {
      ///Initial [Hive] database with the current platform's specific
      ///directory path to the database
      return Hive.init(_documentsDirectory.path);
    } catch (e) {
      print('handled');
    }
  }

  /// Specifies the name of the [box] to [open] for
  /// access.
  Future<Box> open(String box) async {
    return await Hive.openBox(box);
  }

  /// [save] an Modelled [object] in a specified [box] .
  /// The return value is the index of the object
  /// saved in the [box].
  Future<int> save(String box, dynamic object) async {
    final boxAction = await Hive.openBox(box);
    return boxAction.add(object);
  }

  /// [update] the value(s)  of an [object] specified by
  /// the [key] with the provided [value]
  Future<void> update(dynamic key, String box, dynamic value) async {
    final boxAction = await Hive.openBox(box);
    return boxAction.putAt(key, value);
  }

  Future<dynamic> getItem(dynamic key, String box) async {
    final boxAction = await Hive.openBox(box);
    return boxAction.getAt(key);
  }

  Future<List<dynamic>> getAllItem(String box) async {
    final List items = [];

    final boxAction = await Hive.openBox(box);

    for (int index = 0; index < boxAction.length; index++) {
      items.add(boxAction.getAt(index));
    }

    return items;
  }

  /// [remove] the object specified by the [key], from
  /// the selected [box].
  Future<void> remove(dynamic key, String box) async {
    final boxAction = await Hive.openBox(box);
    return boxAction.deleteAt(key);
  }

  ///Closes the Hive database. Observing best practices
  ///necesaary to avoid memory leaks
  Future<void> close(String box) {
    return Hive.box(box).close();
  }
}
