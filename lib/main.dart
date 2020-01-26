import 'package:flutter/material.dart';
import './screens/category_screen.dart';
import './screens/category_page_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Delsi Meals",
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.blue,
          canvasColor: Colors.pink.shade100,
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
      home: CategoryScreen(),
      routes: {
        '/category-meals-screen': (ctx) => CategoryPageScreen(),
      },
    );
  }
}
