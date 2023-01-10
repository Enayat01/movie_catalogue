import 'package:flutter/material.dart';
import 'package:movie_catalogue/provider/movie_provider.dart';
import 'package:provider/provider.dart';
import '../pages/layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MovieProvider(),
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
