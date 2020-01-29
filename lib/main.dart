import 'package:flutter/material.dart';
import 'package:section7_app/data/dummy_data.dart';
import 'package:section7_app/screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/category_page_screen.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegitarian': false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;

  List<Meal> repopulateMeals() {
    return DUMMY_MEALS.where((meal) {
      if (!meal.isGlutenFree && _filters['gluten']) return false;
      if (!meal.isLactoseFree && _filters['lactose']) return false;
      if (!meal.isVegan && _filters['vegan']) return false;
      if (!meal.isVegetarian && _filters['vegitarian']) return false;
      return true;
    }).toList();
  }

  void _setFilters(Map<String, dynamic> selectedfilter) {
    print(selectedfilter);
    setState(() {
      _filters = selectedfilter;
      availableMeals = repopulateMeals();
    });
  }

  List<Meal> favList = [];

  void addToFavToggle(String mealId) {
    var itemIndex = favList.indexWhere((meal) {
      return meal.id == mealId;
    });
    if (itemIndex == -1) {
      setState(() {
        favList.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    } else {
      setState(() {
        favList.removeAt(itemIndex);
      });
    }
    print(favList);
  }

  bool stared (String mealId){
      return favList.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Delsi Meals",
      theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          accentColor: Colors.purple,
          canvasColor: Colors.blue.shade100,
          appBarTheme: AppBarTheme().copyWith(
              textTheme: TextTheme(
                  title: TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 30,
                      fontWeight: FontWeight.bold))),
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                  fontFamily: "RobotoCondensed",
                  fontStyle: FontStyle.normal,
                  fontSize: 18),
              body2: TextStyle(
                  fontFamily: "RobotoCondensed",
                  fontWeight: FontWeight.w300,
                  fontSize: 15),
              title: TextStyle(
                  fontFamily: "RobotoCondensed",
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 20))),

      //  route screen!
      routes: {
        '/': (ctx) => TabsScreen(favList),
        CategoryPageScreen.routeName: (ctx) =>
            CategoryPageScreen(availableMeals),
        MealDetails.routeName: (ctx) => MealDetails(addToFavToggle,stared),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
      // When a route is not present in the route table
      onGenerateRoute: (settings) {},
      // When no route is present in the route table !
      onUnknownRoute: (settings) {},
    );
  }
}
