import 'package:flutter/material.dart';
import '../widgets/nav_items.dart';
import '../utils/constants.dart';

class LeftPane extends StatelessWidget {
  const LeftPane({
    required this.selected,
    required this.mainNavAction,
    Key? key,
  }) : super(key: key);

  final int selected;
  final Function mainNavAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: screenHeight(context) * 0.25,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Colors.indigo[700],
            border: const Border(
              bottom: BorderSide(
                color: Colors.white,
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
                () {},
                selected == 1,
                'New Releases',
                Icons.rocket_launch_outlined,
              ),
              mainNavItem(
                screenWidth(context) / 75,
                () {},
                selected == 2,
                'Most Popular',
                Icons.emoji_events_outlined,
              ),
              mainNavItem(
                screenWidth(context) / 75,
                () {},
                selected == 3,
                'Recommended',
                Icons.verified_outlined,
              ),
              mainNavItem(
                screenWidth(context) / 75,
                () {},
                selected == 4,
                'Top Chart',
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
                'My Collection',
                false,
                () {},
                Icons.stop_circle_rounded,
                Icons.arrow_drop_down,
                screenWidth(context) / 75,
                screenWidth(context) / 75,
              ),
              subNavItem(
                'Bookmark',
                false,
                () {},
                null,
                null,
                screenWidth(context) / 85,
                screenWidth(context) / 85,
              ),
              subNavItem(
                'History',
                false,
                () {},
                null,
                null,
                screenWidth(context) / 85,
                screenWidth(context) / 85,
              ),
              subNavItem(
                'Subscriptions',
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
