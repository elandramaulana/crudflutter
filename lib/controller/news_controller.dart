import 'dart:convert';

import 'package:belajar/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsController {
  final String baseurl = 'https://newsapi.org/v2/top-headlines';
  final String apikey = '8e57879b56b547dd83e7b002685a5d9d';

  Future<List<NewsModel>> fetchNews({String country = 'us'}) async{
    final url = Uri.parse('$baseurl?country=$country&apiKey=$apikey');

  final response = await http.get(url);

  if(response.statusCode == 200){
    final Map<String, dynamic> res = jsonDecode(response.body);
    // print(res['status']);
    final List<dynamic> dataRes = res['articles'];
    return dataRes.map((json) => NewsModel.fromJson(json)).toList();
    
} else {
  throw Exception('Failed to load data');
  }
  }
}