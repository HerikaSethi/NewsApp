
import 'dart:convert';

import 'package:flutter/services.dart';

abstract class NewsRepository {
  Future <Map<String, dynamic>> fetchNews();
}

class LocalNewsRepository implements NewsRepository{
  @override
  Future<Map<String, dynamic>> fetchNews() async {
    String data = await rootBundle.loadString("assets/news_data.json");
    return json.decode(data);
  }
}