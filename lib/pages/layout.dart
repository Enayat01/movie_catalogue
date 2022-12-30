import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_catalogue/widgets/main_pane.dart';
import '../data.dart';
import '../widgets/sort_control.dart';
import '../widgets/profile_section.dart';
import '../widgets/search_bar.dart';
import '../utils/constants.dart';
import '../widgets/left_pane.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  List<Map<String, dynamic>> data = topChart;
  int _currentPage = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        ///Setting a background image for entire layout
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),

        /// Using Backdrop filter to blur the image
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),

          /// Main parent row
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Left pane column for navigation section
              Container(
                width: screenWidth(context) * .20,
                color: Colors.indigo.withOpacity(0.95),
                child: LeftPane(
                  selected: _currentPage,
                  mainNavAction: () {},
                ),
              ),

              /// Right column for header and main pane
              Expanded(
                child: Column(
                  children: [
                    /// Header section with search and profile
                    Container(
                      height: screenHeight(context) * 0.15,
                      color: Colors.indigo.withOpacity(0.80),
                      child: Row(
                        children: [
                          searchBar(),
                          profileSection(),
                        ],
                      ),
                    ),

                    /// Filter section
                    Container(
                      height: screenHeight(context) * 0.15,
                      color: Colors.deepPurple.withOpacity(0.60),
                      child: Row(
                        children: [
                          sortControl(context),
                        ],
                      ),
                    ),

                    /// Main Pane section
                    Expanded(
                      child: Center(
                        child: MainPane(data: data),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
