import 'package:flutter/material.dart';

Widget mainNavItem(double width, VoidCallback onPressed, bool isSelected,
    String title, IconData icon) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      color: isSelected ? Colors.deepPurple.withOpacity(0.15) : null,
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: width,
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: width,
              color: Colors.white,
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
      color: isSelected ? Colors.deepPurple.withOpacity(0.15) : null,
      onPressed: action,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            icon1,
            color: Colors.white,
            size: iconSize,
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: textSize,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 20),
          Icon(
            icon2,
            color: Colors.white,
            size: iconSize,
          ),
        ],
      ),
    ),
  );
}
