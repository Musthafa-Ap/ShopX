import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:shop_x/controller/favorite.dart';
import '../../model/product.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    FavoriteController favcontroller = Get.put(FavoriteController());
    final size = MediaQuery.of(context).size.width;
    return Container(
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(children: [
          Stack(
            children: [
              Container(
                  margin: const EdgeInsets.all(10),
                  height: size * .45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(
                    product.image,
                  )),
              Positioned(
                right: 3,
                top: 3,
                child: CircleAvatar(
                    backgroundColor: Color.fromARGB(31, 122, 119, 119),
                    child: Obx(
                      () {
                        if (favcontroller.isFavorite.isTrue) {
                          return IconButton(
                            onPressed: () {
                              favcontroller.FavSelected();
                              favcontroller.AddtoFav(item: product);
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                          );
                        } else {
                          return IconButton(
                            onPressed: () {
                              favcontroller.FavSelected();
                            },
                            icon: Icon(
                              Icons.favorite_outline,
                              color: Colors.black,
                            ),
                          );
                        }
                      },
                    )),
              )
            ],
          ),
          Text(
            product.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          Text(
            '\$ ${product.price}',
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ]));
  }
}
