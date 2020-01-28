import 'package:flutter/material.dart';
import 'package:section7_app/models/meal.dart';
import 'dart:io';
import '../screens/meal_details_screen.dart';

class MealsItem extends StatelessWidget {
  final String id;
  final String title;
  final double duration;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;

  MealsItem({
    this.id,
    this.title,
    this.imageUrl,
    this.duration,
    this.affordability,
    this.complexity,
  });

  void showRecipe(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetails.routeName, arguments: {
      'id': id,
    }).then((result) {
      print(result);
    });
  }

  String get _getComplexity {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "Unknown";
    }
  }

  String get _getAffordability {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Expensive";
        break;
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return InkWell(
      onTap: () {
        showRecipe(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: new Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      imageUrl,
                      width: mediaQuery.size.width * 1,
                      height: mediaQuery.orientation == Orientation.landscape
                          ? mediaQuery.size.height * 1
                          : mediaQuery.size.height * .4,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 320,
                      child: Text(
                        "$title",
                        style: TextStyle(color: Colors.white, fontSize: 28),
                        overflow: TextOverflow.fade,
                        softWrap: true,
                      ),
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        Icon(Icons.timer),
                        SizedBox(
                          width: 5,
                        ),
                        Text("${duration.toString()}m"),
                      ],
                    ),
                    new Row(
                      children: <Widget>[
                        Icon(Icons.work),
                        SizedBox(
                          width: 5,
                        ),
                        Text(_getComplexity),
                      ],
                    ),
                    new Row(
                      children: <Widget>[
                        Icon(Icons.attach_money),
                        SizedBox(
                          width: 5,
                        ),
                        Text(_getAffordability),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
