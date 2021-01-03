import 'dart:convert';

import 'package:dunija/models/prep_stage.dart';
import 'package:flutter/services.dart';

class Recipe {
  final String name, description;
  final int steps;
  final List<PrepStage> stages;

  Recipe({this.name, this.description, this.steps, this.stages});

  Future<Recipe> getRecipe({recipe_id}) async {
    List<PrepStage> stageList = [];

    //Load JSON file from assets folder
    var jsonString = await rootBundle.loadString("assets/offline/sample.json");

    //Decode Resulting JSON String
    final response = json.decode(jsonString.toString());

    String recipe = response['recipe'];
    String description = response['description'];
    int steps = response['steps'];

    //Get Stages array in JSON string
    var stageResult = response['stages'];

    var _title;
    var _procedure;
    var _duration;
    var _imageUrl;
    var _stageId;

    stageList.clear();
    //Iterate
    for (int i = 0; i < steps; i++) {
      _title = stageResult[i]['title'];
      _procedure = stageResult[i]['procedure'];
      _duration = stageResult[i]['duration'];
      _imageUrl = stageResult[i]['image_url'];
      _stageId = stageResult[i]['stage'];

      stageList.add(PrepStage(
          title: _title,
          procedure: _procedure,
          duration: _duration,
          image: _imageUrl,
          stageNo: _stageId));
    }

    return Recipe(
      name: recipe,
      description: description,
      steps: steps,
      stages: stageList,
    );
  }
}
