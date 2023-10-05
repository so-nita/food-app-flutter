import 'package:app_food/model/product_model.dart';
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
    final query = Supabase.instance.client.from('product');
    PostgrestResponse response;
    // ignore: deprecated_member_use
    response = await query.execute();
    if (response.data != null) {
      return (response.data as List<dynamic>).map((e) => Product()).toList();
    }
    return response.data;
  }
  // Future
}
