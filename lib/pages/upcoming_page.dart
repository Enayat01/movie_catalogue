import 'package:flutter/material.dart';
import 'package:movie_catalogue/widgets/main_pane.dart';

import '../models/movies_model.dart';

class UpcomingPage extends StatelessWidget {
  final List<MovieResults>? movieData;
  final ScrollController scrollController;
  const UpcomingPage({
    required this.movieData,
    required this.scrollController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainPane(
      movieData: movieData,
      scrollController: scrollController,
    );
  }
}
