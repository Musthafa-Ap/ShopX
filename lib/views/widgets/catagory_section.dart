import 'package:flutter/material.dart';

class CatagorySection extends StatelessWidget {
  final _catagories = ["TShirt", "Pants", "Jeans", "Jacket", "Shirts"];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: _catagories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(9.0),
              child: Container(
                width: 75,
                decoration: BoxDecoration(
                    color: index == 0 ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 12),
                  child: Text(
                    _catagories[index],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: index == 0 ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
