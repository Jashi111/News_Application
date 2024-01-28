import 'dart:convert';
import 'package:http/http.dart';
import 'package:newsapp/model/Article.dart';
import 'package:newsapp/model/Source.dart'; // Import the Source class

class ApiService {
  final endPointUrl = "https://newsapi.org/v2/everything?q=tesla&from=2024-01-01&sortBy=publishedAt&apiKey=c4071dc144fd424ab4061d57c16d9117";

  Future<List<Article>> getArticles({String category = 'General'}) async {
    try {
      String categoryEndpointUrl = "https://newsapi.org/v2/everything?q=$category&from=2024-01-01&sortBy=publishedAt&apiKey=c4071dc144fd424ab4061d57c16d9117";
      Response res = await get(Uri.parse(categoryEndpointUrl));

      if (res.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(res.body);
        List<dynamic> body = json['articles'];
        List<Article> articles = body
            .map((dynamic item) =>
            Article.fromJson(item, Source.fromJson(item['source'])))
            .toList();
        return articles;
      } else {
        throw Exception(
            "Failed to load articles. Status code: ${res.statusCode}");
      }
    } catch (e) {
      print("Error during API request: $e");
      throw Exception("Failed to load articles. Error: $e");
    }
  }

  Future<List<Article>> searchArticles(String query) async {
    try {
      print("Search API request is being made");
      String searchEndpointUrl =
          "https://newsapi.org/v2/everything?q=$query&apiKey=c4071dc144fd424ab4061d57c16d9117";
      Response res = await get(Uri.parse(searchEndpointUrl));

      if (res.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(res.body);
        List<dynamic> body = json['articles'];
        List<Article> articles = body
            .map((dynamic item) =>
            Article.fromJson(item, Source.fromJson(item['source'])))
            .toList();
        return articles;
      } else {
        throw Exception(
            "Failed to search articles. Status code: ${res.statusCode}");
      }
    } catch (e) {
      print("Error during search API request: $e");
      throw Exception("Failed to search articles. Error: $e");
    }
  }
}
