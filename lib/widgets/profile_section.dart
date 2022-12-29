import 'package:flutter/material.dart';
import '../utils/constants.dart';

Widget profileSection() {
  return Row(
    children: const [
      Text(
        personName,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      SizedBox(width: 20),
      CircleAvatar(
        backgroundImage: AssetImage('assets/images/user1.jpg'),
        radius: 30,
      ),
      SizedBox(width: 15),
      Icon(
        Icons.settings,
        color: Colors.white,
      ),
      SizedBox(width: 40),
    ],
  );
}
