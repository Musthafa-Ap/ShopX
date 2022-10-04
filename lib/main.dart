import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/controller.dart';
import 'model/product.dart';
import 'views/screens/favorite_screen/favorite_screen.dart';
import 'views/widgets/app_bar_widget.dart';
import 'views/widgets/catagory_section.dart';
import 'views/widgets/header_section.dart';
import 'views/widgets/image_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final controller = Get.put(ProductController());
  //final favcontroller = Get.put(FavoriteScreen());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 248, 246, 246)),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: const PreferredSize(
          child: AppBarWidget(),
          preferredSize: Size.fromHeight(55),
        ),
        body: Column(
          children: [
            HeaderSection(),
            CatagorySection(),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.isTrue) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 2 / 2.9),
                      itemCount: controller.productList.length,
                      itemBuilder: (context, index) {
                        Product product = controller.productList[index];
                        return ImageCard(
                          product: product,
                        );
                      });
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
