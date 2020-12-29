import 'package:dunija/models/prep_stage.dart';
import 'package:flutter/material.dart';

class Recipe {
  final String name, description;
  final int steps;
  final List<PrepStage> stages;

  Recipe(
      {@required this.name,
      @required this.description,
      this.steps,
      this.stages});
}
