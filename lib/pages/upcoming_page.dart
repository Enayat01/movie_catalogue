import 'package:flutter/material.dart';
import 'package:movie_catalogue/widgets/main_pane.dart';

import '../models/movies_model.dart';

class UpcomingPage extends StatefulWidget {
  final List<MovieResults>? movieData;
  final ScrollController scrollController;
  const UpcomingPage({
    required this.movieData,
    required this.scrollController,
    Key? key,
  }) : super(key: key);

  @override
  State<UpcomingPage> createState() => _UpcomingPageState();
}

class _UpcomingPageState extends State<UpcomingPage> {
  @override
  Widget build(BuildContext context) {
    return MainPane(
      movieData: widget.movieData,
      scrollController: widget.scrollController,
    );
  }
}
