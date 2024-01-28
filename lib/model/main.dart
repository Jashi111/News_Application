import 'package:flutter/material.dart';
import 'package:newsapp/view/Splashscreen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // // Initialize Firebase
  // //await Firebase.initializeApp();
  // // Set the status bar color to transparent
  // //SystemChrome.setSystemUIOverlayStyle(
  //     const SystemUiOverlayStyle(statusBarColor: Colors.transparent)
  // );
  // Run your app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const SplashScreen(),
    );
  }
}
