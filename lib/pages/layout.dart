import 'dart:ui';

import 'package:flutter/material.dart';
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

        /// Using Backdrop filter to blur the
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),

          /// Main parent row
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Left pane column
              Container(
                width: screenWidth(context) * .20,
                color: Colors.indigo.withOpacity(0.95),
                child: LeftPane(
                  selected: 0,
                  mainNavAction: () {},
                ),
              ),

              /// Right column for header and main pane
              Expanded(
                child: Column(
                  children: [
                    /// Header section
                    Container(
                      height: 120,
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
                      height: 120,
                      color: Colors.deepPurple.withOpacity(0.60),
                      child: Row(
                        children: [
                          sortControl(),
                        ],
                      ),
                    ),

                    /// Main Pane section
                    const Expanded(
                      child: Center(
                        child: Text(
                          "Main Pane Section",
                          style: TextStyle(color: Colors.white),
                        ),
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
