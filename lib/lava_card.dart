import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/services/feed_services.dart';
import 'package:flutter_app/models/feed_model.dart';

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
    return FutureBuilder<Feed>(
        future: getFeeds(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error");
            }
            if (snapshot.data != null) {
              // print(snapshot.data.items);
              for (var feed in snapshot.data.items) {
                print(feed);
                // var title = feed.title;
                // var description = feed.body;
                // var username = feed.owner.displayName;

                return new Card(
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
                                  title: Text(feed.owner.displayName),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  feed.title,
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
                                        feed.body,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFF757575)),
                                      )))
                            ],
                          ),
                        )));
              }
            }
          } else {
            return Container();
            // return CircularProgressIndicator();
          }
        });
  }
}
