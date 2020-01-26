import 'package:flutter/material.dart';
import 'package:section7_app/widgets/meal_item.dart';
import '../data/dummy_data.dart';


class CategoryPageScreen extends StatelessWidget{

  // final int id;
  // final String title;

  // CategoryPageScreen(this.id,this.title);

  @override 
  Widget build(BuildContext context) {


    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,String>;
    final catId = routeArgs['id'];
    final catTitle = routeArgs['title'];
    final Meals  = DUMMY_MEALS.where((M){
      return M.categories.contains(catId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('${catTitle}'),
      ),
      body:  ListView.builder(
        itemBuilder: (ctx,index){
          return MealsItem(
            affordability: Meals[index].affordability,
            complexity: Meals[index].complexity,
            duration: Meals[index].duration,
            imageUrl: Meals[index].imageUrl,
            title: Meals[index].title,
          );
        },
        itemCount: Meals.length,
      )
    );
  }

}