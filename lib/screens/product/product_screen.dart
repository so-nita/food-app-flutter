import 'package:app_food/constant/constant.dart';
import 'package:app_food/model/product_model.dart';
import 'package:app_food/widgets/widget.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';
  static Route route({required Product product}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => ProductScreen(product: product));
  }

  final Product product;
  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomeAppBar(
        title: 'Product',
        // btnWishlist: IconButton(
        //   onPressed: () {
        //     Navigator.pushNamed(context, Constant().wishlistScreen);
        //   },
        //   icon: const Icon(
        //     Icons.favorite_border,
        //     color: Colors.black,
        //   ),
        // ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, Constant().wishlistScreen,
                      arguments: product);
                },
                icon: const Icon(
                  Icons.favorite_border,
                  size: 24,
                  color: Colors.white,
                ),
              ),
              ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white)),
                onPressed: () {
                  Navigator.pushNamed(context, Constant().cartScreen,
                      arguments: product);
                },
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: 200,
              child: Image.network(
                product.imageurl.toString(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            color: Colors.grey.withOpacity(0.2),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(product.name.toString(),
                      style:
                          const TextStyle(color: Colors.black, fontSize: 18)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    '${product.price}',
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          const ExpansionTile(
            title: Text('Product Information'),
            children: <Widget>[
              ListTile(
                  title: Text(
                      'This is tile number 1 ListTile, useful for creating expansion tile children when the expansion tile represents a sublist.')),
            ],
          ),
          const ExpansionTile(
            title: Text('Delivery Information'),
            children: <Widget>[
              ListTile(
                  title: Text(
                      'This is tile number 1 ListTile, useful for creating expansion tile children when the expansion tile represents a sublist.')),
            ],
          ),
        ],
      ),
    );
  }
}
