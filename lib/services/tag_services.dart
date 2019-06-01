import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter_app/models/tags_model.dart';
import 'package:flutter_app/models/titles_model.dart';

Future<Tags> getTags() async {
  final url =
      'https://api.stackexchange.com/2.2/tags?order=desc&sort=popular&inname=flutter&site=stackoverflow';
  final response = await http.get(url);
  return tagsFromJson(response.body);
}

Future<Titles> getTitles() async {
  final url =
      'https://api.stackexchange.com/2.2/search/advanced?site=stackoverflow&order=desc&sort=activity&filter=withbody&title=flutter';
  final response = await http.get(url);
  return titlesFromJson(response.body);
}
