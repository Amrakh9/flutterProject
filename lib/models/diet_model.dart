import 'package:flutter/material.dart';

class DietModel {
  late String name;
  late String iconPath;
  late String level;
  late String duration;
  late String calories;
  late Color boxColor;
  late bool viewIsSelected;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calories,
    required this.boxColor,
    required this.viewIsSelected
});

  static List<DietModel> getDiets() {
    List<DietModel> diets = [];

    diets.add(
      DietModel(name: "Honey Pancake", iconPath: "assets/icons/shark-fin.svg", level: "Easy", boxColor: Colors.blueAccent, duration: "30 min", calories: "180kCal", viewIsSelected: true)
    );
    diets.add(
      DietModel(name: "Salat", iconPath: "assets/icons/shark-fin.svg", level: "Medium", duration: "1 hour", boxColor: Colors.amberAccent, calories: "300kCal", viewIsSelected: false)
    );

    return diets;
  }
}

