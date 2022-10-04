import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_x/controller/favorite.dart';
import 'package:shop_x/model/product.dart';
import 'package:shop_x/views/widgets/header_section.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Colors.black),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            "Favorites",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        body: Column(
          children: [
            const HeaderSection(),
            GetBuilder(
                init: FavoriteController(),
                builder: (controller) {
                  return Expanded(
                    child: ListView.separated(
                        padding: EdgeInsets.all(10),
                        itemBuilder: (context, index) {
                          Product item = controller.favList[index];
                          return Stack(
                            children: [
                              Container(
                                height: 150,
                                // color: Colors.red,
                                child: Row(children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    width: 150,
                                    //color: Colors.yellow,
                                    child: Image.network(item.image),
                                  ),
                                  Expanded(
                                      child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            //mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item.title,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  item.description,
                                                  overflow: TextOverflow.fade,
                                                  maxLines: 4,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "\$${item.price}",
                                                style: const TextStyle(
                                                    fontSize: 25,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          )))
                                ]),
                              ),
                              CircleAvatar(
                                backgroundColor:
                                    Color.fromARGB(31, 122, 119, 119),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: controller.favList.length),
                  );
                })
          ],
        ));
  }
}
