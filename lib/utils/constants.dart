import 'package:flutter/material.dart';

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

const baseUrl = 'https://api.themoviedb.org/3';
const apiKey = 'afbe66a0ded12ebd4f701d19a2209ee8';
const String posterImageBase = "https://image.tmdb.org/t/p/w342";
const String backdropImageBase = "https://image.tmdb.org/t/p/w780";

const personName = 'Jon De Marve';
const sortBy = 'Sort by';
const duration = 'Duration';
