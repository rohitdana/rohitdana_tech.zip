import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final userData;

  DetailScreen({Key key, this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail Screen"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text("Name : "), Text(userData.name)],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text("Email : "), Text(userData.email)],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [Text("Website : "), Text(userData.website)],
                // ),
              ],
            ),
          ),
        ));
  }
}
