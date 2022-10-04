import 'package:get/state_manager.dart';

import '../model/product.dart';

class FavoriteController extends GetxController {
  var isFavorite = false.obs;
  var favList = <Product>[].obs;

  void AddtoFav({required Product item}) {
    favList.add(item);
  }

  void FavSelected() {
    if (isFavorite.isTrue) {
      isFavorite(false);
    } else {
      isFavorite(true);
    }
  }
}
