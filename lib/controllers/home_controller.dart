import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:pocket_planner/constants.dart';
import 'package:pocket_planner/views/dashboard.dart';
import 'package:pocket_planner/views/home_page.dart';

class HomeController extends StatefulWidget {
  @override
  _HomeControllerState createState() => _HomeControllerState();
}

class _HomeControllerState extends State<HomeController> {
  PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(
      initialIndex: 0,
    );
  }

  List<Widget> _buildScreens() {
    return [Dashboard(), Dashboard(), HomePage()];
  }

  List<PersistentBottomNavBarItem> _navigationBarItems() {
    return [
      PersistentBottomNavBarItem(
          onPressed: (context) {
            _controller.jumpToTab(0);
          },
          icon: Icon(CupertinoIcons.doc),
          title: 'Documents',
          inactiveColorPrimary: Colors.tealAccent,
          activeColorPrimary: Colors.teal),
      PersistentBottomNavBarItem(
          onPressed: (context) {},
          icon: Icon(
            CupertinoIcons.camera,
            color: Colors.black,
          ),
          inactiveColorPrimary: Colors.tealAccent,
          activeColorPrimary: Colors.teal),
      PersistentBottomNavBarItem(
          onPressed: (context) {
            _controller.jumpToTab(2);
          },
          icon: Icon(CupertinoIcons.doc),
          title: 'Documents',
          inactiveColorPrimary: Colors.tealAccent,
          activeColorPrimary: Colors.teal),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        screens: _buildScreens(),
        controller: _controller,
        items: _navigationBarItems(),
        confineInSafeArea: true,
        backgroundColor: kUltraLightBlue // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style15, // Ch
      ),
    );
  }
}
