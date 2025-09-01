import 'package:supabase_flutter/supabase_flutter.dart';
import '../model/product_model.dart';

class ProductRepository {
  static String baseUrl = "https://spzkzgzpibddugxzsgap.supabase.co";
  static String baseKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNwemt6Z3pwaWJkZHVneHpzZ2FwIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzkzNjcyNjIsImV4cCI6MTk5NDk0MzI2Mn0.A1z7gNinDUAhv5oMivvTkeI40OEbhU7RLkvAnvgJCUM";
  final client = SupabaseClient(baseUrl, baseKey);

  Future<List<Product>> getAllProduct() async {
    // ignore: deprecated_member_use

    final query = Supabase.instance.client.from('product');

   final response = await Supabase.instance.client
    .from('product')
    .select();

    var data = response as List<dynamic>;
    var result = data.map((e) => Product.fromJson(e)).toList();
    return result;
  }
}
