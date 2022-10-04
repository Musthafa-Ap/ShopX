import '../model/product.dart';

import 'package:http/http.dart' as http;

class RemoteServices {
  Future<List<Product>?> getProducts() async {
    var client = http.Client();
    var uri = Uri.parse("https://fakestoreapi.com/products");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return productFromJson(json);
    } else {
      print("Data didn't get from the server");
      return null;
    }
  }
}
