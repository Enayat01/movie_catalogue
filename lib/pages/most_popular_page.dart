import 'package:flutter/material.dart';
import '../widgets/main_pane.dart';

import '../models/movies_model.dart';

class MostPopularPage extends StatefulWidget {
  final List<MovieResults>? movieData;
  final ScrollController scrollController;
  const MostPopularPage({
    required this.movieData,
    required this.scrollController,
    Key? key,
  }) : super(key: key);

  @override
  State<MostPopularPage> createState() => _MostPopularPageState();
}

class _MostPopularPageState extends State<MostPopularPage> {
  @override
  Widget build(BuildContext context) {
    return MainPane(
      movieData: widget.movieData,
      scrollController: widget.scrollController,
    );
  }
}
