import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:spiro_mobile/model/videothumbnail.dart';

List<videothumbnail> parseVideothumbnail(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  List<videothumbnail> videoinfo =
      list.map((model) => videothumbnail.fromJson(model)).toList();
  return videoinfo;
}

Future<List<videothumbnail>> fetchvideothumbnail() async {
  final response = await http.get('https://picsum.photos/200/300');
  if (response.statusCode == 200) {
    return compute(parseVideothumbnail, response.body);
  } else {
    throw Exception('request Api error');
  }
}

//fetured api
Future<Map> getPics() async {
  String url =
      "https://pixabay.com/api/videos/?key=20534376-861b32acdab584a566507b99d&q=scene";
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

//latest api
Future<Map> getLatest() async {
  String url =
      "https://pixabay.com/api/videos/?key=20534376-861b32acdab584a566507b99d&q=cars";
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

//top views
Future<Map> getTopViews() async {
  String url =
      "https://pixabay.com/api/videos/?key=20534376-861b32acdab584a566507b99d&q=education";
  http.Response response = await http.get(url);
  return json.decode(response.body);
}
