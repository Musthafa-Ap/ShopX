import 'package:flutter/material.dart';
import 'package:shop_x/views/screens/favorite_screen/favorite_screen.dart';
import 'package:shop_x/views/widgets/black_icon_button.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      // centerTitle: true,
      backgroundColor: Colors.white,
      title: const Text(
        "ShopX",
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
      ),
      actions: [
        BlackIconButton(
          icon: Icons.search,
          pressFunction: () {
            print("hie");
          },
        ),
        BlackIconButton(
          icon: Icons.favorite_outline,
          pressFunction: () {
            Get.to(() => FavoriteScreen());
          },
        ),
        BlackIconButton(
          icon: Icons.shopping_bag_outlined,
          pressFunction: () {},
        )
      ],
    );
  }
}
