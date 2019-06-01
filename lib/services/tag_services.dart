import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter_app/models/tags_model.dart';

Future<Tags> getTags() async {
  final url =
      'https://api.stackexchange.com/2.2/tags?order=desc&sort=popular&inname=flutter&site=stackoverflow';
  final response = await http.get(url);
  return tagsFromJson(response.body);
}
