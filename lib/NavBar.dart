import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/screen/AddCart.dart';
import 'package:fooddelivery/screen/Home.dart';
import 'package:fooddelivery/screen/Setting.dart';

class NavBar extends StatefulWidget {
  int count;
    NavBar({Key? key, required this.count}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  Widget? _child;

  @override
  void initState() {
    _child = const HomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int count =0;
    setState(() {
      count=widget.count;
    });
    return Scaffold(

      body:
      _child,
      extendBody: true,
      bottomNavigationBar: FluidNavBar(
        icons: [
          FluidNavBarIcon(icon: Icons.home),
          FluidNavBarIcon(icon: Icons.add_shopping_cart),
          FluidNavBarIcon(icon: Icons.settings),
        ],
        style: FluidNavBarStyle(
            barBackgroundColor: Colors.cyan.shade50,
            iconSelectedForegroundColor: Colors.black,
            iconUnselectedForegroundColor: Colors.black

        ),
        onChange: _handleNavigationChange,
        defaultIndex: count,
        itemBuilder: (icon, item) => Semantics(
          // label: icon.extras!["label"],
          child: item,
        ),
      ),
    );
  }
  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = const HomeScreen();
          break;
        case 1:
          _child = const AddCart();
          break;
        case 2:
          _child = const Setting();
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: const Duration(milliseconds: 500),
        child: _child,
      );
    });
  }

}
