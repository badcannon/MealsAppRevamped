import 'package:flutter/material.dart';
import 'package:section7_app/models/meal.dart';
import '../data/dummy_data.dart';

class MealDetails extends StatelessWidget {
  static const String routeName = "/meal-details";

  buildTheList(BuildContext ctx, List<String> list, int length) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      height: 150,
      child: ListView.builder(
        padding: EdgeInsets.all(2),
        itemBuilder: (_, index) {
          return Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  child: Text((index + 1).toString()),
                ),
                title: Text(
                  list[index],
                  softWrap: true,
                ),
              ),
              Divider()
            ],
          );
        },
        itemCount: length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
     var routeArgs =
      ModalRoute.of(context).settings.arguments  as Map<String,Object> ;
    var Id = routeArgs['id'];
    final Meal selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == Id);
    final Function removeMeal =routeArgs['remove'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${selectedMeal.title}",
          style: Theme.of(context).textTheme.title.copyWith(
                fontSize: 24,
                color: Colors.white,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
            new Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Ingredients",
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  new Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Theme.of(context).accentColor),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1,
                            offset: Offset.fromDirection(1),
                            color: Theme.of(context).accentColor,
                          )
                        ]),
                    child: buildTheList(
                      context,
                      selectedMeal.ingredients,
                      selectedMeal.ingredients.length,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Steps",
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  new Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Theme.of(context).accentColor),
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1,
                            offset: Offset.fromDirection(1),
                            color: Theme.of(context).accentColor,
                          )
                        ]),
                    child: buildTheList(
                      context,
                      selectedMeal.steps,
                      selectedMeal.steps.length,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete_outline),
        onPressed: (){
          Navigator.of(context).pop(removeMeal(selectedMeal.id));
        },
      ),
    );
  }
}

// TO Do :
// Add background images to the ingrediants and  Steps
