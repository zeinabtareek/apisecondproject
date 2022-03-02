import 'dart:convert';
import 'package:apisecondproject/model/articel_model.dart';
import 'package:apisecondproject/model/articels_model.dart';
import 'package:apisecondproject/model/category_list.dart';
import 'package:apisecondproject/model/category_model.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart'as http;



class FetchApis{

  String apiKey ='ff07382cc1f84dc4870f8ed0d3def8b7';
  String URL ='https://newsapi.org/v2/top-headlines?country=eg&apiKey=';
  String topHedLines='top-headline';
  String url='https://newsapi.org/v2';
  late String category;

  Future<List<Article>> fetchdata(String category)async{

          http.Response response = await http.get(Uri.parse('$url/top-headlines?country=eg&category=$category&apiKey=ff07382cc1f84dc4870f8ed0d3def8b7'));
        String data = response.body;
        var jsonData = jsonDecode(data);
        print(response.body);
        ArticlesList articles = ArticlesList.fromJson(jsonData);
        List<Article> articlesList =
        articles.articles!.map((e) => Article.fromJson(e)).toList();
      return articlesList;

    }

 getCategoryName(category)async{
    try {
      String ?category;
      http.Response response = await http.get(Uri.parse(
          '$url/top-headlines?country=eg&category=$category&apiKey=ff07382cc1f84dc4870f8ed0d3def8b7'));
      return category;
    }on Exception catch (e) { 			// Anything else that is an exception
      print('Unknown exception: $e');
    }

  }
 }