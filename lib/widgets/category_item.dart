import 'package:flutter/material.dart';
import '../models/category.dart';
import '../screens/category_page_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  final String imageUrl;

  const CategoryItem(this.title, this.color, this.id, this.imageUrl);

  void ShowCategoryPage(BuildContext ctx) {
    // Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
    //   return CategoryPageScreen(id,title);
    // }));

    Navigator.of(ctx).pushNamed('/category-meals-screen', arguments: {
      'title': title,
      'id': id,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ShowCategoryPage(context);
      },
      splashColor: Theme.of(context).accentColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
          ),
          width: double.infinity,
            child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        )),
        Container(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(color: Colors.white),
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // gradient: LinearGradient(colors: [Colors.black.withOpacity(0.15), Colors.white38]),
              border: Border.all(
                  width: 1,
                  style: BorderStyle.solid,
                  color: Theme.of(context).accentColor)),
        ),
      ]),
    );
  }
}
