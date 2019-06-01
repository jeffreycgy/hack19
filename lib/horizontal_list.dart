import 'package:flutter/material.dart';
import 'package:flutter_app/services/tag_services.dart';
import 'package:flutter_app/models/tags_model.dart';
import 'dart:convert';

class HorizontalTags extends StatefulWidget {
  HorizontalTags({Key key}) : super(key: key);

  @override
  _HorizontalList createState() => _HorizontalList();
}

class _HorizontalList extends State<HorizontalTags> {
  Container getTagWidgets(String name) {
    return new Container(
        margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        decoration: new BoxDecoration(
            color: Color(0xFF42A5F5),
            borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(25),
                topRight: const Radius.circular(25),
                bottomLeft: const Radius.circular(25),
                bottomRight: const Radius.circular(25))),
        child: Padding(
            padding: EdgeInsets.fromLTRB(10, 4, 10, 0),
            child: Column(children: <Widget>[
              Text(
                name,
                style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
              )
            ])));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Tags>(
        future: getTags(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              // return Text("Error");
              var tags = [
                'flutter-layout',
                'flutter-dependencies',
                'flutter-animation',
                'flutter-test',
                'flutter-sliver',
                'flutter-plugin',
                'flutter-navigation',
                'flutter-redux',
                'flutter-web',
                'flutterwave',
                'flutter-appbar',
                'flutter-packages'
              ];
              return Container(
                margin: EdgeInsets.fromLTRB(20, 5, 0, 5),
                height: 30.0,
                width: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    for (var name in tags) getTagWidgets(name)
                  ],
                ),
              );
            }
            print(json.encode(snapshot.data));
            return Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 30.0,
              width: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  for (var item in snapshot.data.items) getTagWidgets(item.name)
                ],
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
