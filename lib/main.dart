import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kindler App 🔥',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future populateUsers;

  Future requestData() async {
    // request the data
    var response = await http.get('https://kindler-app.herokuapp.com/users');

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  }

  @override
  void initState() {
    super.initState();
    populateUsers = requestData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Kindler I CARE ABOUT YOU 🔥',
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.red,
          ),
        ),
        centerTitle: true,
        elevation: .2,
      ),
      body: FutureBuilder(
        future: populateUsers,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (_, i) {
                  var data = snapshot.data[i];
              return FriendCard(
                name: data['name'],
                tag: data['tag'],
                photo: data['photo'],
              );
            });
          }

          return Text('Loading...');
        },
      ),
    );
  }
}

class FriendCard extends StatelessWidget {
  final String name;
  final String tag;
  final String photo;

  FriendCard({
    key,
    this.name,
    this.tag,
    this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.network(photo),
        Text(tag),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 100.0,
              width: 100.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                border: new Border.all(
                    color: Color.fromRGBO(200, 200, 200, .5),
                    width: 12.0,
                    style: BorderStyle.solid),
              ),
              child: Icon(
                Icons.close,
                color: Colors.red,
                size: 50.0,
              ),
            ),
            Container(
              width: 100.0,
              height: 100.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                border: new Border.all(
                    color: Color.fromRGBO(200, 200, 200, .5),
                    width: 12.0,
                    style: BorderStyle.solid),
              ),
              child: Icon(
                Icons.favorite,
                color: Colors.greenAccent,
                size: 50.0,
              ),
            ),
          ],
        )
      ],
    );
  }
}
