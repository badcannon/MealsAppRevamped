import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../data/dummy_data.dart';


class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: EdgeInsets.all(20),
        children: <Widget>[
            ...DUMMY_CATEGORIES.map((catData){
              return CategoryItem(catData.title, catData.color,catData.id,catData.imageUrl);
            }).toList(),
          
        ],
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
      );

  }
}
