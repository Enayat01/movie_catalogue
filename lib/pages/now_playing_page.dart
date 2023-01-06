import 'package:flutter/material.dart';
import '../models/movies_model.dart';
import '../widgets/main_pane.dart';

class NowPlayingPage extends StatelessWidget {
  final List<MovieResults>? movieData;
  final ScrollController scrollController;
  const NowPlayingPage({
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
