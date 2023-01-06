import 'package:flutter/material.dart';

Widget searchBar(TextEditingController textEditingController,
    Function(String)? onSubmitted) {
  return Flexible(
    child: TextField(
      onSubmitted: onSubmitted,
      controller: textEditingController,
      decoration: const InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Icon(
            Icons.search,
            color: Colors.white60,
            size: 30,
          ),
        ),
        hintText: 'Search By Title, Genre and Year',
        hintStyle: TextStyle(color: Colors.white60, fontSize: 20),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      ),
      cursorColor: Colors.white60,
      style: const TextStyle(
        color: Colors.white60,
        fontSize: 20,
      ),
      cursorHeight: 25,
    ),
  );
}
