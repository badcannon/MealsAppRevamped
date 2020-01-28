import 'package:flutter/material.dart';
import 'package:section7_app/widgets/meal_item.dart';
import '../data/dummy_data.dart';
import '../models/meal.dart';

class CategoryPageScreen extends StatefulWidget {
  // final int id;
  // final String title;

  // CategoryPageScreen(this.id,this.title);
  static const String routeName = '/category-meals-screen';

  @override
  _CategoryPageScreenState createState() => _CategoryPageScreenState();
}

class _CategoryPageScreenState extends State<CategoryPageScreen> {
  @override
  void initState() {
    // Context is not allowed here !
    super.initState();
  }

  var _initalLoad = false;
  String catTitle;
  List<Meal> Meals;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initalLoad) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final catId = routeArgs['id'];
       catTitle = routeArgs['title'];
      Meals = DUMMY_MEALS.where((M) {
        return M.categories.contains(catId);
      }).toList();
      _initalLoad = true;
    }
  }

  void _removeMeals(String mealId) {
    Meals.removeWhere((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${catTitle}'),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealsItem(
              id: Meals[index].id,
              affordability: Meals[index].affordability,
              complexity: Meals[index].complexity,
              duration: Meals[index].duration,
              imageUrl: Meals[index].imageUrl,
              title: Meals[index].title,
              removeMeal : _removeMeals,
            );
          },
          itemCount: Meals.length,
        ));
  }
}
