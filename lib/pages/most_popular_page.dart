import 'package:flutter/material.dart';
import '../widgets/main_pane.dart';

import '../models/movies_model.dart';

class MostPopularPage extends StatelessWidget {
  final List<MovieResults>? movieData;
  final ScrollController scrollController;
  const MostPopularPage({
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
