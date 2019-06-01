import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class LavaCard extends StatefulWidget {
  @override
  _LavaCardState createState() => _LavaCardState();
}

class _LavaCardState extends State<LavaCard> {
  Future navigateToSubPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DetailsPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.fromLTRB(24, 24, 24, 0),
        child: InkWell(
            splashColor: Color(0xFFF5f5f5),
            onTap: () {
              print('Card tapped');
              navigateToSubPage(context);
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Align(
                    child: ListTile(
                      leading: Icon(Icons.album, size: 40),
                      title: Text('lavajeff'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'How to code in Flutter long tieltefwfwe qdwedqw dqwd',
                      style: TextStyle(
                          fontSize: 22,
                          color: Color(0xFF212121),
                          fontFamily: 'Proxima Nova'),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(
                            'A list tile contains one to three lines of text optionally flanked by icons or other widgets, such as check boxes. The icons (or other widgets) for the tile are defined with the leading and trailing parameters',
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFF757575)),
                          )))
                ],
              ),
            )));
  }
}
