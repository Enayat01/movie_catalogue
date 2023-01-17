import 'package:flutter/material.dart';

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

/// Colors
const whiteColor = Colors.white;
const textColor = Colors.white;
const textColorLight = Colors.white60;
const textColorLight70 = Colors.white70;
const hoveringColor = Colors.white70;
const iconColor = Colors.white;
const iconColorLight = Colors.white60;
const indicatorColor = Colors.white;
const ratingBoxColor = Colors.yellowAccent;
const ratingTextColor = Colors.black;
const indigoColor = Colors.indigo;
final indigo700Color = Colors.indigo[700];
final deepPurpleTranslucent = Colors.deepPurple.withOpacity(0.15);
final imageCardBackground = Colors.indigo.withOpacity(0.5);
final listCardBackground = Colors.indigo.withOpacity(0.4);
const listImageBoxColor = Colors.white54;

const baseUrl = 'https://api.themoviedb.org/3';
const apiKey = 'afbe66a0ded12ebd4f701d19a2209ee8';
const String posterImageBase = "https://image.tmdb.org/t/p/w342";
const String backdropImageBase = "https://image.tmdb.org/t/p/w780";

const personName = 'Jon De Marve';
const sortBy = 'Sort by';
const duration = 'Duration';
const searchHintWeb = 'Search By Title, Genre and Year';

/// side bar/left pane texts
const nowPlayingTitle = 'Now Playing';
const mostPopularTitle = 'Most Popular';
const upcomingTitle = 'Up Coming';
const topChartTitle = 'Top Chart';
const collectionTitle = 'My Collection';
const bookmarkTitle = 'Bookmark';
const historyTitle = 'History';
const subscriptionTitle = 'Subscriptions';

/// Main pane texts
const notFound = 'No movies found';
const imageUnavailable = 'Image not available';
