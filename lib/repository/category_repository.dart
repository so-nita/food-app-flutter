import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/category_model.dart';

class CategoryRepository {
  static String baseUrl = "https://spzkzgzpibddugxzsgap.supabase.co";
  static String baseKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNwemt6Z3pwaWJkZHVneHpzZ2FwIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzkzNjcyNjIsImV4cCI6MTk5NDk0MzI2Mn0.A1z7gNinDUAhv5oMivvTkeI40OEbhU7RLkvAnvgJCUM";
  final client = SupabaseClient(baseUrl, baseKey);

  // Get

  Future<List<Category>> getAllCategory() async {
    // ignore: deprecated_member_use
    //var response = await client.from('category').select().execute();
    final response = await Supabase.instance.client
      .from('category')
      .select();

    var data = response as List<dynamic>;

    var result = data.map((e) => Category.fromJson(e)).toList();
    return result;
  }

  // Future<void> createCategory(String name, String imageUrl) async {
  //   var request = await client
  //       .from('category')
  //       .insert([Category(name: name, imageurl: imageUrl)])
  //       // ignore: deprecated_member_use
  //       .execute();
  //   print(request.data);
  // }

  // Future<List<Category>> getCategory() async{
  //   var response = await
  // }
}
