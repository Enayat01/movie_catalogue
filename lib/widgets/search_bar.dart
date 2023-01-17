import 'package:flutter/material.dart';
import '../utils/constants.dart';

Widget searchBar(
  TextEditingController textEditingController,
  Function(String)? onChanged,
) {
  return Flexible(
    child: TextField(
      onChanged: onChanged,
      controller: textEditingController,
      decoration: const InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Icon(
            Icons.search,
            color: iconColorLight,
            size: 30,
          ),
        ),
        hintText: searchHintWeb,
        hintStyle: TextStyle(
          color: textColorLight,
          fontSize: 20,
        ),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
      ),
      cursorColor: iconColorLight,
      style: const TextStyle(
        color: textColorLight,
        fontSize: 20,
      ),
      cursorHeight: 25,
    ),
  );
}
