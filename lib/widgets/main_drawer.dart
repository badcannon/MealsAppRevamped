import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';
class MainDrawer extends StatelessWidget {
  Widget _buildTile(String text, IconData icon,Function tapHandler ) {
    return ListTile(
      contentPadding: EdgeInsets.all(5),
      leading: Icon(
        icon,
        size: 30,
        color: Colors.pink,
      ),
      title: Text(
        text,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Drawer(
      child: new Column(
        children: <Widget>[
          Container(
            child: Text(
              "Meal Recipes",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            height: mediaQuery.size.height * 0.2,
            width: mediaQuery.size.width,
            color: Theme.of(context).primaryColor,
            alignment: Alignment.centerLeft,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                _buildTile("Meals", Icons.restaurant,(){
                  Navigator.of(context).pushReplacementNamed("/");
                }),
                _buildTile("Filters", Icons.settings,(){
                  Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
