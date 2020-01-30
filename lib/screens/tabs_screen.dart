import 'package:flutter/material.dart';
import 'package:section7_app/widgets/main_drawer.dart';
import './category_screen.dart';
import './favorites_screen.dart';
import '../models/meal.dart';
import '../screens/user_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favList;

  TabsScreen(this.favList);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      {
        'page': CategoryScreen(),
        'title': "Categories",
      },
      {
        'page': FavoritesScreen(widget.favList),
        'title': "Your Favorites",
      },
      {
        'page': UserScreen(),
        'title': "User Profile",
      }
    ];
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        // Fixed is the default ! which will not require seperate background color !
        // type: BottomNavigationBarType.shifting,
        selectedFontSize: 18,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text("Favorites"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("User"),
          )
        ],
        
      ),
      // initialIndex: 0,
    );
  }
}

//  DefaultTabController(
//       length: 2,
//           child: Scaffold(
//             appBar: AppBar(
//               title: Text("Meals"),
//               bottom: TabBar(
//                 tabs: <Widget>[
//                   Tab(
//                     icon: Icon(Icons.category),
//                     text: "Categories",
//                   ),
//                   Tab(
//                     icon: Icon(Icons.star),
//                     text: "Favorites",
//                   )

//                 ],
//               ),

//             ),
//           body: TabBarView(
//               children: <Widget>[
//                 new CategoryScreen(),
//                 new FavoritesScreen()
//               ],
//           ),

//       ),
//       // initialIndex: 0,
//     );
