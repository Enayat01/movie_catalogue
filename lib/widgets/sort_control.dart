import 'package:flutter/material.dart';
import '../utils/constants.dart';

Widget sortControl(
    BuildContext context, VoidCallback onListPressed, onGridPressed) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      /// Sort button row
      Row(
        children: [
          SizedBox(width: screenWidth(context) / 20),
          const Text(
            sortBy,
            style: TextStyle(
              color: textColorLight,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton(
              style: const TextStyle(
                color: textColor,
              ),
              iconEnabledColor: iconColor,
              items: [
                DropdownMenuItem(
                  onTap: () {},
                  child: const Text(duration),
                ),
              ],
              onChanged: (selected) {},
              autofocus: true,
            ),
          ),
        ],
      ),

      /// View control buttons row
      Row(
        children: [
          IconButton(
            onPressed: onListPressed,
            icon: const Icon(
              Icons.view_list,
              size: 35,
              color: iconColor,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          IconButton(
            onPressed: onGridPressed,
            icon: const Icon(
              Icons.view_module,
              size: 35,
              color: iconColor,
            ),
          ),
          SizedBox(width: screenWidth(context) / 20),
        ],
      ),
    ],
  );
}
