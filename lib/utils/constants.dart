import 'package:flutter/material.dart';

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

const String posterImageBase = "https://image.tmdb.org/t/p/w342";
const String backdropImageBase = "https://image.tmdb.org/t/p/w300";

const personName = 'Jon De Marve';
const sortBy = 'Sort by';
const duration = 'Duration';
