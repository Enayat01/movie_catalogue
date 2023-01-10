import 'package:flutter/material.dart';
import '../utils/constants.dart';

Widget sortControl(
    BuildContext context, VoidCallback onListPressed, onGridPressed) {
  return Flexible(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Sort button row
        Row(
          children: [
            SizedBox(width: screenWidth(context) / 20),
            const Text(
              sortBy,
              style: TextStyle(
                color: Colors.white60,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton(
                style: const TextStyle(
                  color: Colors.white,
                ),
                iconEnabledColor: Colors.white,
                items: [
                  DropdownMenuItem(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(duration),
                    ),
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
                color: Colors.white,
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
                color: Colors.white,
              ),
            ),
            SizedBox(width: screenWidth(context) / 20),
          ],
        ),
      ],
    ),
  );
}
