import 'package:flutter/material.dart';
import 'package:movie_catalogue/provider/movie_detail_provider.dart';
import 'package:movie_catalogue/provider/movie_provider.dart';
import 'package:provider/provider.dart';
import '../pages/layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MovieProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MovieDetailProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'The Movie Catalogue',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const AppLayout(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
