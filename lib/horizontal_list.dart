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
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 20.0),
  //     height: 200.0,
  //     child: ListView(
  //       scrollDirection: Axis.horizontal,
  //       children: <Widget>[
  //         Container(
  //           width: 160.0,
  //           color: Colors.red,
  //         ),
  //         Container(
  //           width: 160.0,
  //           color: Colors.blue,
  //         ),
  //         Container(
  //           width: 160.0,
  //           color: Colors.green,
  //         ),
  //         Container(
  //           width: 160.0,
  //           color: Colors.yellow,
  //         ),
  //         Container(
  //           width: 160.0,
  //           color: Colors.orange,
  //         ),
  //       ],
  //     ),
  //   );
  // }

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
              height: 10.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    height: 10.0,
                    width: 45.0,
                    margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                    color: Colors.deepPurple[200],
                  ),
                ],
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
