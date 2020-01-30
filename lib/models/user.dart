import 'package:flutter/material.dart';
import '../models/meal.dart';

// The User Model :
class User {
  final String firstName;
  final String lastName;
  final String username;
  final String emailId;
  final String imageUrl;
// final List<Meal> favRecipes;

  const User({
    this.firstName,
    this.lastName,
    this.username,
    this.imageUrl,
    this.emailId,
  });
}
