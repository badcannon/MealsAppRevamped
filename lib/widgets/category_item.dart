
import 'package:flutter/material.dart';
import '../models/category.dart';
import '../screens/category_page_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  const CategoryItem(this.title, this.color,this.id);

  void ShowCategoryPage(BuildContext ctx) {
    // Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
    //   return CategoryPageScreen(id,title);
    // }));

    Navigator.of(ctx).pushNamed(
      '/category-meals-screen',arguments: {
        'title' : title,
        'id' : id,
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ShowCategoryPage(context);
      },
      splashColor: Theme.of(context).accentColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [color.withOpacity(0.7), color]),
            border: Border.all(
                width: 1,
                style: BorderStyle.solid,
                color: Theme.of(context).accentColor)),
      ),
    );
  }
}
