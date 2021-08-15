import 'dart:convert';
import 'package:dunija/models/prep_stage.dart';
import 'package:flutter/material.dart';

class DataManager {
  static Future<List<PrepStage>> getStageData(
      BuildContext context, final recipeId) async {
    // String baseUrl = AppStrings.baseUrl;
    // String endpoint = '/recipe/stages';

    //List containing stages
    List<PrepStage> stages = [];

    ///For Fetching JSON file online
    // var response = await http.post(baseUrl + endpoint, body:{
    //   recipe_id: key
    // });

    var response = await DefaultAssetBundle.of(context)
        .loadString('assets/offline/sample.json');

    var result = json.decode(response);

    // String recipe = result['recipe'];
    int steps = result['steps'];

    var stageResult = result['stages'];

    //Clear list
    stages.clear();

    //Iterate
    for (int i = 0; i < steps; i++) {
      stages.add(
        PrepStage(
            title: stageResult[i]['title'],
            procedure: stageResult[i]['procedure'],
            duration: stageResult[i]['duration'],
            image: stageResult[i]['image_url'],
            stageNo: stageResult[i]['stage']),
      );
    }
    return stages;
  }
}
