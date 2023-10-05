import 'package:app_food/model/category_model.dart';
import 'package:app_food/model/product_model.dart';
import 'package:app_food/screens/screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('This is route : ${settings.name}');
    switch (settings.name) {
      case '/':
        return HomeScreen.route();

      case CartScreen.routeName:
        return CartScreen.route(product: settings.arguments as Product?);

      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);

      case CategoryScreen.routeName:
        return CategoryScreen.route(category: settings.arguments as Category);

      case WishlistScreen.routeName:
        return WishlistScreen.route(product: settings.arguments as Product?);

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('Error'),
        ),
      ),
    );
  }
}
