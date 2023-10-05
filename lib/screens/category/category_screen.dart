import 'package:app_food/bloc/product/product_bloc.dart';
import 'package:app_food/bloc/product/product_event.dart';
import 'package:app_food/bloc/product/product_state.dart';
import 'package:app_food/model/category_model.dart';
import 'package:app_food/model/product_model.dart';
import 'package:app_food/repository/product_repository.dart';
import 'package:app_food/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/widget.dart';

class CategoryScreen extends StatelessWidget {
  static const String routeName = "/category";
  final Category category;

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => CategoryScreen(category: category),
    );
  }

  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<ProductRepository>(
      create: (context) => ProductRepository(),
      child: BlocProvider<ProductBloc>(
        create: (context) => ProductBloc(
          RepositoryProvider.of<ProductRepository>(context),
        )..add(ProductLoadingEvent()),
        child: Scaffold(
          appBar: CustomeAppBar(title: "Category Screen"),
          bottomNavigationBar: const CustomNavBar(),
          body: BlocBuilder<ProductBloc, ProductState>(
            builder: (BuildContext context, state) {
              if (state is ProductLoadedState) {
                List<Product> productCategory = state.products
                    .where((e) => e.categoryid == category.id).toList();
                return GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  childAspectRatio: 1 / .7,
                  children: List.generate(
                    productCategory.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, top: 20),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: ProductCard(product: productCategory[index]),
                        ),
                      );
                    },
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return BlocProvider(
  //     create: (context) => ProductBloc(RepositoryProvider.of(context))
  //       ..add(ProductLoadingEvent()),
  //     child: Scaffold(
  //         appBar: CustomeAppBar(title: category.name.toString()),
  //         bottomNavigationBar: const CustomNavBar(),
  //         body: BlocBuilder<ProductBloc, ProductState>(
  //           builder: (context, state) {
  //             if (state is ProductLoadedState) {
  //               List<Product> productOfCategory = state.products
  //                   .where((e) => e.categoryid == category.id)
  //                   .toList();
  //               //print(productOfCategory);
  //             }
  //             return Container();
  //           },
  //         )
  //         // body: BlocBuilder<ProductBloc, ProductState>(
  //         // //  buildWhen: (previous, current) => previous != current,
  //         //   builder: (BuildContext context, state) {
  //         //     print(category.name);
  //         //     if (state is ProductLoadedState) {
  //         //       List<Product> productCategory = state.products.toList();
  //         //       print(productCategory);
  //         //       // List<Product> productCategory =
  //         //       //     state.products.where((e) => e.name == category.name).toList();
  //         //       return const Card(
  //         //         child: Text("data"),
  //         //       );
  //         //       // return GridView.builder(
  //         //       //   padding:
  //         //       //       const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
  //         //       //   itemCount: productCategory.length,
  //         //       //   itemBuilder: (context, index) {
  //         //       //     return Center(
  //         //       //       child: ProductCard(
  //         //       //         product: productCategory[index],
  //         //       //         width: 2.2,
  //         //       //       ),
  //         //       //     );
  //         //       //   },
  //         //       //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //         //       //     crossAxisCount: 2,
  //         //       //     childAspectRatio: 1.42,
  //         //       //   ),
  //         //       // );
  //         //     } else {
  //         //       return const Center(
  //         //         child: Text('No data'),
  //         //       );
  //         //     }
  //         //   },
  //         // ),
  //         ),
  //   );
  // }
}
