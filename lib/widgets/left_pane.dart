import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/movie_provider.dart';
import '../utils/constants.dart';

class LeftPane extends StatefulWidget {
  const LeftPane({
    required this.selected,
    required this.onItemSelect,
    Key? key,
  }) : super(key: key);

  final int selected;
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
    final movieProvider = Provider.of<MovieProvider>(context, listen: false);

    return Column(
      children: [
        Container(
          height: screenHeight(context) * 0.25,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: indigo700Color,
            border: const Border(
              bottom: BorderSide(
                color: whiteColor,
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
                    currentPage = 0;
                    widget.onItemSelect(currentPage);
                    movieProvider.page = 1;
                    movieProvider.nowPlayingMovieResults.clear();
                    movieProvider.getNowPlayingMovies(true);
                  });
                },
                currentPage == 0,
                nowPlayingTitle,
                Icons.play_circle_fill_outlined,
              ),
              mainNavItem(
                screenWidth(context) / 75,
                () {
                  setState(() {
                    currentPage = 1;
                    widget.onItemSelect(currentPage);
                    movieProvider.page = 1;
                    movieProvider.popularMovieResults.clear();
                    movieProvider.getPopularMovies(true);
                  });
                },
                currentPage == 1,
                mostPopularTitle,
                Icons.emoji_events_outlined,
              ),
              mainNavItem(
                screenWidth(context) / 75,
                () {
                  setState(() {
                    currentPage = 2;
                    widget.onItemSelect(currentPage);
                    movieProvider.upcomingMovieResults.clear();
                    movieProvider.getUpcomingMovies(true);
                  });
                },
                currentPage == 2,
                upcomingTitle,
                Icons.new_releases_outlined,
              ),
              mainNavItem(
                screenWidth(context) / 75,
                () {
                  setState(() {
                    currentPage = 3;
                    widget.onItemSelect(currentPage);
                    movieProvider.page = 1;
                    movieProvider.topRatedMovieResults.clear();
                    movieProvider.getTopRatedMovies(true);
                  });
                },
                currentPage == 3,
                topChartTitle,
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
                collectionTitle,
                false,
                () {},
                Icons.stop_circle_rounded,
                Icons.arrow_drop_down,
                screenWidth(context) / 75,
                screenWidth(context) / 75,
              ),
              subNavItem(
                bookmarkTitle,
                false,
                () {},
                null,
                null,
                screenWidth(context) / 85,
                screenWidth(context) / 85,
              ),
              subNavItem(
                historyTitle,
                false,
                () {},
                null,
                null,
                screenWidth(context) / 85,
                screenWidth(context) / 85,
              ),
              subNavItem(
                subscriptionTitle,
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

Widget mainNavItem(double width, VoidCallback onPressed, bool isSelected,
    String title, IconData icon) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      color: isSelected ? deepPurpleTranslucent : null,
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: width,
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: width,
              color: textColor,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget subNavItem(String title, bool isSelected, VoidCallback action,
    IconData? icon1, IconData? icon2, double? textSize, double? iconSize) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      color: isSelected ? deepPurpleTranslucent : null,
      onPressed: action,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            icon1,
            color: iconColor,
            size: iconSize,
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: textSize,
              color: textColor,
            ),
          ),
          const SizedBox(width: 20),
          Icon(
            icon2,
            color: iconColor,
            size: iconSize,
          ),
        ],
      ),
    ),
  );
}
