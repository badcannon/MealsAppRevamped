import 'package:flutter/foundation.dart';


enum Affordability {
  Affordable,
  Pricey,
  Luxurious
}

enum Complexity {
  Simple,
  Challenging,
  Hard
}

class Meal {

  final String id;
  final List<String> categories;
  final String title;
  final Affordability affordability;
  final Complexity complexity;
  final String imageUrl;
  final double duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;



   const Meal({
    this.categories,
    this.affordability,
    this.complexity,
    this.duration,
    this.id,
    this.imageUrl,
    this.ingredients,
    this.isLactoseFree,
    this.title,
    this.isGlutenFree,
    this.isVegan,
    this.isVegetarian,
    this.steps
  });








}