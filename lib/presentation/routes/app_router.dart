import 'package:flutter/material.dart';
import 'package:shopp_app_mobx/widgets/bottom_nav_widget.dart';
import '../screens/product_detail_page.dart';

class AppRouter {
  Route<dynamic> getAppRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BottomNavWidget(),
        );

      case '/product_detail_screen':
        return MaterialPageRoute(
          builder: (_) => const ProductDetailScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => BottomNavWidget(),
        );
    }
  }
}
