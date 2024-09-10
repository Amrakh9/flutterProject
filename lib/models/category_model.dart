import 'package:flutter/material.dart';

class CategoryModel {
  late String name;
  late String iconPath;
  late Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
        CategoryModel(name: "Salad", iconPath: "assets/icons/shark-fin.svg", boxColor: Colors.brown)
    );
    categories.add(
        CategoryModel(name: "Cake", iconPath: "assets/icons/shark-fin.svg", boxColor: Colors.yellow)
    );
    categories.add(
        CategoryModel(name: "Brownie", iconPath: "assets/icons/shark-fin.svg", boxColor: Colors.blue)
    );
    categories.add(
        CategoryModel(name: "Brownie", iconPath: "assets/icons/shark-fin.svg", boxColor: Colors.blue)
    );

    return categories;
  }
}
