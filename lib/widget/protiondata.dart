import 'package:flutter/material.dart';
import 'package:wingbank/models/datapromotion.dart';

class pro extends StatelessWidget {
  // const pro({super.key});
  final Promotiondata item;

  const pro({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(bottom: 8),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(25),
          child: Image.asset(item.img, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
