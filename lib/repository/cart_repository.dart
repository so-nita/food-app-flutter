import 'package:app_food/model/cart.dart';
import 'package:app_food/model/product_model.dart';

class CartRepository {
  Future<Cart> getCartItems() async {
    List<Product> cartItems = [
      Product(
          id: "bebf60ea-9941-4547-9a19-406f8909d757",
          name: "Milk Tea",
          imageurl:
              "https://media.istockphoto.com/id/510487752/photo/hot-latte-art-with-cactus-on-table-wooden.jpg?s=612x612&w=0&k=20&c=unuxp0M9GOm9hF_tY5UYug35P4wSbK6ozsnVu3RI1qc=",
          price: 2.5,
          isrecommend: false,
          ispopular: true,
          categoryid: "b914b535-5488-4244-bd65-e880b668de39"),
      Product(
        id: "4221e703-5564-4701-8063-783d2a1e7b70",
        name: "Bread",
        imageurl:
            "https://images.pexels.com/photos/1099680/pexels-photo-1099680.jpeg?auto=compress&cs=tinysrgb&w=600",
        price: 2.8,
        isrecommend: false,
        ispopular: true,
        categoryid: "db38601c-cc15-4ebe-b71f-61446c0252d5",
      ),
      Product(
        id: "d1f93a87-d431-456c-846f-767b572dcd6e",
        name: "Latte",
        imageurl:
            "https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=600",
        price: 3.33,
        isrecommend: false,
        ispopular: true,
        categoryid: "b914b535-5488-4244-bd65-e880b668de39",
      ),
    ];
    return Cart(products: cartItems);
  }

  Future<Cart> getShopItems() async {
    List<Product> cartItems = [
      Product(
          id: "bebf60ea-9941-4547-9a19-406f8909d757",
          name: "Milk Tea",
          imageurl:
              "https://media.istockphoto.com/id/510487752/photo/hot-latte-art-with-cactus-on-table-wooden.jpg?s=612x612&w=0&k=20&c=unuxp0M9GOm9hF_tY5UYug35P4wSbK6ozsnVu3RI1qc=",
          price: 2.5,
          isrecommend: false,
          ispopular: true,
          categoryid: "b914b535-5488-4244-bd65-e880b668de39"),
      Product(
        id: "4221e703-5564-4701-8063-783d2a1e7b70",
        name: "Bread",
        imageurl:
            "https://images.pexels.com/photos/1099680/pexels-photo-1099680.jpeg?auto=compress&cs=tinysrgb&w=600",
        price: 2.8,
        isrecommend: false,
        ispopular: true,
        categoryid: "db38601c-cc15-4ebe-b71f-61446c0252d5",
      ),
      Product(
        id: "d1f93a87-d431-456c-846f-767b572dcd6e",
        name: "Latte",
        imageurl:
            "https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=600",
        price: 3.33,
        isrecommend: false,
        ispopular: true,
        categoryid: "b914b535-5488-4244-bd65-e880b668de39",
      ),
    ];
    return Cart(products: cartItems);
  }
}
