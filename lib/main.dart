import 'package:app_food/config/app_router.dart';
import 'package:app_food/repository/category_repository.dart';
import 'package:app_food/screens/home/home_screen.dart';
import 'package:app_food/widgets/themedata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/product/product_bloc.dart';
import 'repository/product_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

// Password supabase database table Prodyuct : CX4PsPwoJap6QLJE

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ProductRepository repository = ProductRepository();
    return MaterialApp(
      theme: theme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      // initialRoute: HomeScreen.routeName,
      home: MultiRepositoryProvider(
          providers: [
            RepositoryProvider<ProductRepository>(
              create: (context) => ProductRepository(),
            ),
            RepositoryProvider<CategoryRepository>(
              create: (context) => CategoryRepository(),
            ),
          ],
          child: MultiBlocProvider(providers: [
            BlocProvider<ProductBloc>(
              create: (_) => ProductBloc(ProductRepository()),
            ),
          ], child: const HomeScreen())),
    );
  }
}
