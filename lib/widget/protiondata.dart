import 'package:flutter/material.dart';
import 'package:wingbank/models/datapromotion.dart';

class pro extends StatelessWidget {
  // const pro({super.key});
  final Promotiondata item;

  const pro({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.all(Radius.circular(12)),
      ),
      child: ClipRect(
        // clipBehavior: ,
        child: Image.asset(item.img),
      ),
    );
  }
}
