import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = "/actual-home";
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWith = 42;
  double bottomBarBorderWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const Center(
      child: Text("Account Page"),
    ),
    const Center(
      child: Text("Cart Page"),
    ),
  ];
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        //called whenever there is a tap in one of the icons
        onTap: updatePage,
        items: [
          //HOME
          BottomNavigationBarItem(
            label: "",
            icon: Container(
              width: bottomBarWith,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 0
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(Icons.home_outlined),
            ),
          ),
          //ACCOUNT / PROFILE
          BottomNavigationBarItem(
            label: "",
            icon: Container(
              width: bottomBarWith,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 1
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: const Icon(Icons.person_outlined),
            ),
          ),

          //CART TAB
          BottomNavigationBarItem(
            label: "",
            icon: Container(
              width: bottomBarWith,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page == 2
                        ? GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backgroundColor,
                    width: bottomBarBorderWidth,
                  ),
                ),
              ),
              child: Badge(
                elevation: 0,
                badgeContent: const Text("2"),
                badgeColor: Colors.white,
                child: const Icon(Icons.shopping_cart_outlined),
              ),
            ),
          ),
        ],
      ),
    );
  }
}