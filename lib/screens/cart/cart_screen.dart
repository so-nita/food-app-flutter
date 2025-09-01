import 'package:flutter/material.dart';
import 'package:food_app/model/product_model.dart';
import 'package:food_app/widgets/widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key, this.product});
  final Product? product;
  static const String routeName = '/cart';

  static Route route({Product? product}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => CartScreen(product: product),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (product != null) {
      return Scaffold(
        appBar: CustomeAppBar(title: 'Cart Screen'),
        bottomNavigationBar: const CustomNavBar(),
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
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_circle),
                    ),
                    const Text(
                      '1',
                      style: TextStyle(fontSize: 17),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.remove_circle),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
    return Scaffold(
      appBar: CustomeAppBar(title: 'Cart Screen'),
      bottomNavigationBar: const CustomNavBar(),
      body: const Center(
        child: Text("No item "),
      ),
    );
  }
}
