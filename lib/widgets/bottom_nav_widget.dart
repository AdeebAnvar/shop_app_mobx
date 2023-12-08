import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shopp_app_mobx/logic/bottom_nav/bottom_nav_store.dart';
import 'package:shopp_app_mobx/presentation/screens/cart_screen.dart';
import 'package:shopp_app_mobx/presentation/screens/login_screen.dart';
import 'package:shopp_app_mobx/presentation/screens/profile_screen.dart';
import 'package:shopp_app_mobx/presentation/screens/search_screen.dart';

class BottomNavWidget extends StatefulWidget {
  BottomNavWidget({Key? key}) : super(key: key);
  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  final List<Widget> pages = [
    LoginScreen(),
    const SearchScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
  BottomNavWidgetStore? bottomNavWidgetStore;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    bottomNavWidgetStore ??= Provider.of<BottomNavWidgetStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        body: pages[bottomNavWidgetStore!.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomNavWidgetStore!.currentIndex,
          selectedItemColor: Colors.teal.shade500,
          onTap: (index) => bottomNavWidgetStore!.onChangeIndex(index),
          unselectedItemColor: Colors.black38,
          iconSize: 30,
          elevation: 4,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: ''),
            BottomNavigationBarItem(icon: CircleAvatar(), label: ''),
          ],
        ),
      );
    });
  }
}
