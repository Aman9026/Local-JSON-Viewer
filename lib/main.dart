import 'dart:convert';
import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: new HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Local JSON Viewer"),
      ),
      body: new Container(
        child: new Center(
          child: new FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString("JSONAssets/people.json"),
              builder: (context, snapshot) {
                ///Decoding JSON here
                var data = json.decode(snapshot.data.toString());

                return new ListView.builder(
                  itemBuilder: (context, index) {
                    return new Card(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          new Text("Name: " + data[index]['name']),
                          new Text("Age: " + data[index]['age']),
                          new Text("Height: " + data[index]['height']),
                          new Text("Hair Color: " + data[index]['hair_color']),
                        ],
                      ),
                    );
                  },
                  itemCount: data == null ? 0 : data.length,
                );
              }),
        ),
      ),
    );
  }
}
