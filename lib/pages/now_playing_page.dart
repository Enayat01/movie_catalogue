import 'package:flutter/material.dart';
import '../models/movies_model.dart';
import '../widgets/main_pane.dart';

class NowPlayingPage extends StatefulWidget {
  final List<MovieResults>? movieData;
  final ScrollController scrollController;
  const NowPlayingPage({
    required this.movieData,
    required this.scrollController,
    Key? key,
  }) : super(key: key);

  @override
  State<NowPlayingPage> createState() => _NowPlayingPageState();
}

class _NowPlayingPageState extends State<NowPlayingPage> {
  @override
  Widget build(BuildContext context) {
    return MainPane(
      movieData: widget.movieData,
      scrollController: widget.scrollController,
    );
  }
}
