import 'package:food_app/model/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class WishlistRepository {
  // final database = FirebaseDatabase.instance.reference();
  // final Product product;
  // void createProduct() {
  //   database.set({
  //     product.
  //   });
  // }
  Future<List<Product>> getProduct() async {
  final response = await Supabase.instance.client
      .from('product')
      .select();

  if (response != null) {
    return (response as List<dynamic>)
        .map((e) => Product.fromJson(e)) // assuming you have a fromJson
        .toList();
  }
  return [];
}

  // Future
}
