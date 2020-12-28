import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rohitdana_tech/models/users.dart';
import 'package:rohitdana_tech/screens/home/detail.dart';
import 'package:rohitdana_tech/services/api.dart';

void main() => runApp(HomeScreen());

class HomeScreen extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Http App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyListScreen(),
    );
  }
}

class MyListScreen extends StatefulWidget {
  @override
  createState() => _MyListScreenState();
}

class _MyListScreenState extends State {
  var users = new List<User>();

  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Home",
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),
          elevation: 10,
          backgroundColor: Colors.blue,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(color: Colors.blue),
              ),
              ListTile(
                title: Text('Home'),
                onTap: () => {Navigator.pop(context)},
              ),
              ListTile(
                title: Text('Home 2'),
                onTap: () => {Navigator.pop(context)},
              ),
              ListTile(
                title: Text('Home 3'),
                onTap: () => {Navigator.pop(context)},
              ),
              ListTile(
                title: Text('Home 4'),
                onTap: () => {Navigator.pop(context)},
              )
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return new GestureDetector(
              child: ListTile(title: Text(users[index].name)),
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        userData: users[index],
                      ),
                    ))
              },
            );
          },
        ));
  }
}
