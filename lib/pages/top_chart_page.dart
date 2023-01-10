import 'package:flutter/material.dart';
import '../models/movies_model.dart';
import '../widgets/main_pane.dart';

class TopChartPage extends StatefulWidget {
  final List<MovieResults>? movieData;
  final ScrollController scrollController;
  const TopChartPage({
    required this.movieData,
    required this.scrollController,
    Key? key,
  }) : super(key: key);

  @override
  State<TopChartPage> createState() => _TopChartPageState();
}

class _TopChartPageState extends State<TopChartPage> {
  @override
  Widget build(BuildContext context) {
    return MainPane(
      movieData: widget.movieData,
      scrollController: widget.scrollController,
    );
  }
}
