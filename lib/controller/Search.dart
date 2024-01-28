import 'package:flutter/material.dart';
import '../model/Article.dart';
import '../view/articleDetails.dart';
import 'apiservice.dart';

class ArticleSearch extends SearchDelegate<List<Article>> {
  final ApiService apiService;

  ArticleSearch(this.apiService);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, []);
      },
    );
  }
  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: apiService.searchArticles(query),
      builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.hasData) {
          List<Article>? articles = snapshot.data;
          return ListView.builder(
            itemCount: articles?.length ?? 0,
            itemBuilder: (context, int index) => ListTile(
              title: Text(articles![index].title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => articleView(article: articles![index]),
                  ),
                );
              },
            ),
          );
        } else {
          return const Center(
            child: Text('No data available'),
          );
        }
      },
    );
  }
  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: apiService.getArticles(category: ''),
      builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.hasData) {
          List<Article>? articles = snapshot.data;
          final filteredArticles = articles?.where(
                (article) =>
                article.title.toLowerCase().contains(query.toLowerCase()),
          );
          return ListView.builder(
            itemCount: filteredArticles?.length ?? 0,
            itemBuilder: (context, int index) => ListTile(
              title: Text(filteredArticles!.toList()[index].title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => articleView(
                      article: filteredArticles!.toList()[index],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return const Center(
            child: Text('No data available'),
          );
        }
      },
    );
  }
}
