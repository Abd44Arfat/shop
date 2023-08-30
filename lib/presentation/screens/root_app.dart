import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:untitled/presentation/screens/search_screen.dart';
import 'package:untitled/presentation/screens/setting_screen.dart';

import 'cart_screen.dart';
import 'home_screen.dart';


class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff696969),
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [
        HomeScreen(),
        SearchResultsScreen(),
        CartScreen(),
        SettingScreen()
      ],
    );
  }
  Widget getFooter() {
    List items = [
      FeatherIcons.home,
      FeatherIcons.grid,
      FeatherIcons.shoppingCart,
      FeatherIcons.user,
    ];
    return Container(
      height: 80,
      decoration: BoxDecoration(color: Color(0xFF262626)),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  activeTab = index;
                });
              },
              child: Container(
                width: 45,
                height: 45,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: activeTab == index
                            ? ShapeDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.67, -0.75),
                            end: Alignment(-0.67, 0.75),
                            colors: [Color(0xFF4FBBE3), Color(0xFF4E5BB3)],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        )
                            : null,
                      ),
                    ),
                    Positioned.fill(
                      child: IconButton(
                        icon: Icon(
                          items[index],
                          color: activeTab == index ? Colors.white : Colors.white60,
                        ),
                        onPressed: () {
                          setState(() {
                            activeTab = index;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }}