import 'package:app_food/constant/constant.dart';
import 'package:flutter/material.dart';
import '../model/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double width;
  const ProductCard({super.key, required this.product, this.width = 2.5});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Constant().productScreen,
            arguments: product);
      },
      child: Stack(
        children: <Widget>[
          SizedBox(
            height: 115,
            width: MediaQuery.of(context).size.width / width,
            child: Image.network(
              product.imageurl.toString(),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 55,
            child: Container(
              height: 45,
              width: MediaQuery.of(context).size.width / width,
              color: Colors.transparent.withOpacity(0.4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 7, top: 3),
                    child: Column(
                      children: [
                        Text(
                          product.name.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          product.price.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Constant().cartScreen,
                          arguments: product);
                    },
                    icon: const Icon(
                      Icons.add_circle,
                      size: 26,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
