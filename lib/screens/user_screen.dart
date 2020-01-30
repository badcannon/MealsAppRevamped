import 'package:flutter/material.dart';
import 'package:section7_app/data/dummy_data.dart';
import '../models/user.dart';

class UserScreen extends StatelessWidget {
  // String firstName,lastName,userName;
  var firstName = DUMMY_USER[0].firstName;
  var lastName = DUMMY_USER[0].lastName;
  var userName = DUMMY_USER[0].username;
  var emailId = DUMMY_USER[0].emailId;
  var imageUrl = DUMMY_USER[0].imageUrl;

  Widget detailBuilder(String Postion1, String Postion2, BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "$Postion1 ",
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(
              width: 5,
            ),
            Text("$Postion2"),
          ],
        ),
        padding: EdgeInsets.all(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          new Container(
            width: MediaQuery.of(context).size.width * .8,
            height: MediaQuery.of(context).size.height * .5,
            alignment: Alignment.center,
            padding: EdgeInsets.all(5),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
            decoration: BoxDecoration(
              border: Border.all(width: 2,color: Theme.of(context).primaryColor),
              color: Theme.of(context).accentColor
            ),
          ),
          SizedBox(
            height: 10,
          ),
          detailBuilder("Username", "$userName", context),
          SizedBox(
            height: 5,
          ),
          detailBuilder("Name", "$firstName $lastName", context),
          SizedBox(
            height: 5,
          ),
          detailBuilder("Email", "$emailId", context),
        ],
      ),
    );
  }
}
