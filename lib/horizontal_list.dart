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
        height: 30.0,
        width: 200,
        margin: const EdgeInsets.only(left: 5.0, right: 5.0),
        decoration: new BoxDecoration(
            color: Colors.deepPurple[200],
            borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(3.0),
                topRight: const Radius.circular(3.0))),
        child: Column(children: <Widget>[Text(name)]));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Tags>(
        future: getTags(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error");
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
