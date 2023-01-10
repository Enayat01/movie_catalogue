import 'package:flutter/material.dart';
import '../models/movies_model.dart';
import '../widgets/main_pane.dart';

class TopChartPage extends StatelessWidget {
  final List<MovieResults>? movieData;
  final ScrollController scrollController;
  final bool isGridview;
  const TopChartPage({
    required this.movieData,
    required this.scrollController,
    required this.isGridview,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainPane(
      movieData: movieData,
      scrollController: scrollController,
      isGridview: isGridview,
    );
  }
}
