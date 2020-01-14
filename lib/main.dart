import 'package:flutter/material.dart';

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

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Kindler 🔥',
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.red,
          ),
        ),
        centerTitle: true,
        elevation: .2,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.network('https://randomuser.me/api/portraits/lego/4.jpg'),

              Text("Hi, I'm Bex, 22"),

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
                      style: BorderStyle.solid
                  ),
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
                      style: BorderStyle.solid
                  ),
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
      ),
    );
  }
}
