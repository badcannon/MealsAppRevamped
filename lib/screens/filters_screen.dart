import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filter-meals";
  final Function setFilters;
  final Map<String, bool> filters;
  FiltersScreen(this.filters, this.setFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree;
  var _isVegan;
  var _isVegetarian;
  var _isLactoseFree;

  @override
  void initState() {
    super.initState();
    _isGlutenFree = widget.filters['gluten'];
    _isVegan = widget.filters['vegan'];
    _isVegetarian = widget.filters['vegitarian'];
    _isLactoseFree = widget.filters['lactose'];
  }

  Widget _buildSwitch(
      String title, String description, Function handler, bool value) {
    return SwitchListTile(
        value: value,
        title: Text(title),
        subtitle: Text(description),
        onChanged: handler);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, bool> selectedfilter = {
      'gluten': _isGlutenFree,
      'lactose': _isLactoseFree,
      'vegan': _isVegan,
      'vegitarian': _isVegetarian,
    };
    return Scaffold(
        appBar: AppBar(
          title: Text("Filters"),
          actions: <Widget>[
            FlatButton(
              child: Icon(Icons.save_alt),
              onPressed: () {
                widget.setFilters(selectedfilter);
                },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: new Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  "Filter your Meals here ",
                  style:
                      Theme.of(context).textTheme.title.copyWith(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
                width: double.infinity,
              ),
              _buildSwitch("Gluten Free", "Exclude Only Gluten Free recipes",
                  (val) {
                setState(() {
                  _isGlutenFree = val;
                });
              }, _isGlutenFree),
              _buildSwitch("Vegan", "Exclude Only Vegan recipes", (val) {
                setState(() {
                  _isVegan = val;
                });
              }, _isVegan),
              _buildSwitch("Vegetarian", "Exclude Only Vegetarian recipes",
                  (val) {
                setState(() {
                  _isVegetarian = val;
                });
              }, _isVegetarian),
              _buildSwitch("Lactose Free", "Exclude Only Lactose Free recipes",
                  (val) {
                setState(() {
                  _isLactoseFree = val;
                });
              }, _isLactoseFree),
            ],
          ),
        ));
  }
}
