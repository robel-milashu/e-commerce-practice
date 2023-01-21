import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.amber,
          border: Border.all(width: 2, color: Colors.green),
          borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
