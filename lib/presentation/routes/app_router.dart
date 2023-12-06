import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/product_detail_page.dart';

class AppRouter {
  Route<dynamic> getAppRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      case '/product_detail_screen':
        return MaterialPageRoute(
          builder: (_) => const ProductDetailScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
    }
  }
}
