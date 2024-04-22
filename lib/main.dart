import 'package:flutter/material.dart';
import 'package:movie_api/movie_module/screen/movie_screen.dart';

void main(){
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MovieScreen(),
      theme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
        )
      ),
    );
  }
}