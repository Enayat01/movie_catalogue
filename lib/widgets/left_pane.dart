import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/movie_provider.dart';
import '../widgets/nav_items.dart';
import '../utils/constants.dart';

class LeftPane extends StatefulWidget {
  const LeftPane({
    required this.selected,
    required this.mainNavAction,
    required this.onItemSelect,
    Key? key,
  }) : super(key: key);

  final int selected;
  final Function mainNavAction;
  final ValueChanged<int> onItemSelect;

  @override
  State<LeftPane> createState() => _LeftPaneState();
}

class _LeftPaneState extends State<LeftPane> {
  late int currentPage;
  @override
  void initState() {
    super.initState();
    currentPage = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    return Column(
      children: [
        Container(
          height: screenHeight(context) * 0.25,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Colors.indigo[700],
            border: const Border(
              bottom: BorderSide(
                color: Colors.white,
                width: 2,
              ),
            ),
          ),
          child: Image.asset('assets/images/tmdb.png'),
        ),
        Expanded(
          child: Column(
            children: [
              const SizedBox(height: 20),
              mainNavItem(
                screenWidth(context) / 75,
                () {
                  setState(() {
                    widget.onItemSelect(currentPage);
                    currentPage = 1;
                    movieProvider.page = 1;
                    movieProvider.movieResults.clear();
                    movieProvider.getNowPlayingMovies(true);
                  });
                },
                widget.selected == 1,
                'Now Playing',
                Icons.play_circle_fill_outlined,
              ),
              mainNavItem(
                screenWidth(context) / 75,
                () {
                  setState(() {
                    widget.onItemSelect(currentPage);
                    currentPage = 2;
                    movieProvider.page = 1;
                    movieProvider.movieResults.clear();
                    movieProvider.getPopularMovies(true);
                  });
                },
                widget.selected == 2,
                'Most Popular',
                Icons.emoji_events_outlined,
              ),
              mainNavItem(
                screenWidth(context) / 75,
                () {
                  setState(() {
                    widget.onItemSelect(currentPage);
                    currentPage = 3;
                    movieProvider.page = 1;
                  });
                },
                widget.selected == 3,
                'Recommended',
                Icons.verified_outlined,
              ),
              mainNavItem(
                screenWidth(context) / 75,
                () {
                  setState(() {
                    widget.onItemSelect(currentPage);
                    currentPage = 4;
                    movieProvider.page = 1;
                    movieProvider.movieResults.clear();
                    movieProvider.getTopRatedMovies(true);
                  });
                },
                widget.selected == 4,
                'Top Chart',
                Icons.diamond_outlined,
              )
            ],
          ),
        ),
        const SizedBox(height: 30),
        Expanded(
          child: Column(
            children: [
              subNavItem(
                'My Collection',
                false,
                () {},
                Icons.stop_circle_rounded,
                Icons.arrow_drop_down,
                screenWidth(context) / 75,
                screenWidth(context) / 75,
              ),
              subNavItem(
                'Bookmark',
                false,
                () {},
                null,
                null,
                screenWidth(context) / 85,
                screenWidth(context) / 85,
              ),
              subNavItem(
                'History',
                false,
                () {},
                null,
                null,
                screenWidth(context) / 85,
                screenWidth(context) / 85,
              ),
              subNavItem(
                'Subscriptions',
                false,
                () {},
                null,
                null,
                screenWidth(context) / 85,
                screenWidth(context) / 85,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
