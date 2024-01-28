import 'package:flutter/material.dart';
import 'package:newsapp/view/ArticleTile.dart';
import 'package:newsapp/view/NavigationPanel.dart';
import '../controller/Search.dart';
import '../controller/apiservice.dart';
import '../model/Article.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiService client = ApiService();
  late String selectedCategory; // Track the selected category

  @override
  void initState() {
    super.initState();
    // Set a default category when the widget is first created
    selectedCategory = 'General';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationPanel(
        onCategorySelected: (category) {
          // Handle category selection
          setState(() {
            selectedCategory = category;
          });
          Navigator.pop(context); // Close the drawer after selecting a category
        },
      ),
      appBar: AppBar(
        title: Text('Real-Time News - $selectedCategory', style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white), // Set icon color to white
        actions: [
          // Search bar implementation
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              showSearch(
                context: context,
                delegate: ArticleSearch(client),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: FutureBuilder(
          future: client.getArticles(category: selectedCategory),
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
                itemBuilder: (context, int index) => articleTile(articles![index], context),
              );
            } else {
              return const Center(
                child: Text('No data available'),
              );
            }
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Home(title: "My Home Page"), // Example usage with a title
  ));
}
