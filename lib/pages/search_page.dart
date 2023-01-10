import 'package:flutter/material.dart';
import '../models/movies_model.dart';
import '../widgets/main_pane.dart';

class SearchPage extends StatefulWidget {
  final List<MovieResults>? movieData;
  final ScrollController scrollController;
  const SearchPage(
      {required this.movieData, required this.scrollController, Key? key})
      : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return MainPane(
      movieData: widget.movieData,
      scrollController: widget.scrollController,
    );
  }
}
