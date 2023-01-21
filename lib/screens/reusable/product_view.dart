import 'package:flutter/material.dart';

class ProductViewScreen extends StatelessWidget {
  ProductViewScreen({super.key, this.product, required this.trailing});
  var product;

  Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.grey),
          borderRadius: BorderRadius.circular(15)),
      child: ListTile(
          leading: SizedBox(
            child: Image.asset(
              width: 60,
              height: 50,
              "assets/men-shoes.jpg",
              fit: BoxFit.contain,
            ),
          ),
          title: Text(
            product['brand'],
            style: const TextStyle(fontSize: 18),
          ),
          subtitle: Text(
            product['price'].toString(),
            style: const TextStyle(fontSize: 16),
          ),
          trailing: trailing),
    );
  }
}
