import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter_app/models/feed_model.dart';

Future<Feed> getFeeds() async {
  final url =
      'https://api.stackexchange.com/2.2/search/advanced?site=stackoverflow&order=desc&sort=activity&filter=withbody&title=flutter';
  final response = await http.get(url);
  return feedFromJson(response.body);
}
