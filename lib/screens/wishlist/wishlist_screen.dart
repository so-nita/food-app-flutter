import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/bloc/product/product_bloc.dart';
import 'package:food_app/bloc/product/product_event.dart';
import 'package:food_app/widgets/custome_appbar.dart';
import 'package:food_app/widgets/custome_navbar.dart';
import '../../constant/constant.dart';
import '../../model/product_model.dart';

class WishlistScreen extends StatelessWidget {
  final Product? product;
  const WishlistScreen({super.key, this.product});

  static const String routeName = '/wishlist';
  // final Product products;
  static Route route({Product? product}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => WishlistScreen(product: product),
    );
  }

  @override
  Widget build(BuildContext context) {
    //print(product.name);
    if (product != null) {
      print(product);
      return BlocProvider(
        create: (context) => ProductBloc(RepositoryProvider.of(context))
          ..add(ProductLoadingEvent()),
        child: Scaffold(
          appBar: CustomeAppBar(title: 'Wishlist'),
          // bottomNavigationBar: const CustomNavBar(),
          bottomNavigationBar: BottomNavBarCart(product: product),
          body: Container(
            height: 100,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100,
                  width: 90,
                  padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
                  child: Image(
                    image: NetworkImage(product!.imageurl.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(product!.name.toString(),
                        style: const TextStyle(fontSize: 17)),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        product!.price.toString(),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Constant().cartScreen,
                          arguments: product);
                    },
                    icon: const Icon(Icons.shopping_cart_outlined),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: CustomeAppBar(title: 'Wishlist'),
      bottomNavigationBar: const CustomNavBar(),
      body: const Center(
        child: Text("No Data"),
      ),
    );
  }
}

class BottomNavBarCart extends StatelessWidget {
  const BottomNavBarCart({
    super.key,
    required this.product,
  });

  final Product? product;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.black),
            ),
            onPressed: () {
              Navigator.pushNamed(context, Constant().productScreen,
                  arguments: product);
            },
            child: const Text(
              'Go To Checkout',
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
      // body: BlocBuilder<ProductBloc, ProductState>(
      //       builder: (BuildContext context, state) {
      //         if (state is ProductLoadedState) {
      //           List<Product> products = state.products;
      //           return GridView.builder(
      //             padding:
      //                 const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      //             itemCount: (products.isEmpty) ? 0 : products.length,
      //             itemBuilder: (context, index) {
      //               return Container(
      //                 height: 100,
      //                 decoration: BoxDecoration(
      //                     border: Border.all(color: Colors.grey.shade300)),
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     Container(
      //                       padding: const EdgeInsets.only(top: 8, bottom: 8),
      //                       child: Image.network(
      //                           'https://images.pexels.com/photos/1099680/pexels-photo-1099680.jpeg?auto=compress&cs=tinysrgb&w=600'),
      //                     ),
      //                     Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       mainAxisAlignment: MainAxisAlignment.center,
      //                       children: const [
      //                         Text('Product Name',
      //                             style: TextStyle(fontSize: 16)),
      //                         Text(
      //                           "Price : 12.2",
      //                           style: TextStyle(fontSize: 16),
      //                         ),
      //                       ],
      //                     ),
      //                     Row(
      //                       children: [
      //                         IconButton(
      //                           onPressed: () {},
      //                           icon: const Icon(Icons.add_circle),
      //                         ),
      //                         const Text(
      //                           '2',
      //                           style: TextStyle(fontSize: 17),
      //                         ),
      //                         IconButton(
      //                           onPressed: () {},
      //                           icon: const Icon(Icons.remove_circle),
      //                         ),
      //                       ],
      //                     )
      //                   ],
      //                 ),
      //               );
      //             },
      //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //               crossAxisCount: 1,
      //               childAspectRatio: 4.2,
      //             ),
      //           );
      //         }
      //         return const SizedBox();
      //       },
      //     ),

        // List Ptoduct add to cart
        //Container(
        //             height: 100,
        //             decoration: BoxDecoration(
        //                 border: Border.all(color: Colors.grey.shade300)),
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Container(
        //                   padding: const EdgeInsets.only(top: 8, bottom: 8),
        //                   child: Image.network(
        //                       'https://images.pexels.com/photos/1099680/pexels-photo-1099680.jpeg?auto=compress&cs=tinysrgb&w=600'),
        //                 ),
        //                 Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   mainAxisAlignment: MainAxisAlignment.center,
        //                   children: const [
        //                     Text('Product Name',
        //                         style: TextStyle(fontSize: 16)),
        //                     Text(
        //                       "Price : 12.2",
        //                       style: TextStyle(fontSize: 16),
        //                     ),
        //                   ],
        //                 ),
        //                 Row(
        //                   children: [
        //                     IconButton(
        //                       onPressed: () {},
        //                       icon: const Icon(Icons.add_circle),
        //                     ),
        //                     const Text(
        //                       '2',
        //                       style: TextStyle(fontSize: 17),
        //                     ),
        //                     IconButton(
        //                       onPressed: () {},
        //                       icon: const Icon(Icons.remove_circle),
        //                     ),
        //                   ],
        //                 )
        //               ],
        //             ),
        //           );