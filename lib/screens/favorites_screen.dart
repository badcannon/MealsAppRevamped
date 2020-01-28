import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {

  List<Meal> favList;

  FavoritesScreen(this.favList);

  @override
  Widget build(BuildContext context) {
    return favList.length > 0
          ? ListView.builder(
              itemBuilder: (ctx, index) {
                return MealsItem(
                  id: favList[index].id,
                  affordability: favList[index].affordability,
                  complexity: favList[index].complexity,
                  duration: favList[index].duration,
                  imageUrl: favList[index].imageUrl,
                  title: favList[index].title,
                );
              },
              itemCount: favList.length,
            )
          : Center(
              child: Text("No Items to Show :("),
            );
  }
}