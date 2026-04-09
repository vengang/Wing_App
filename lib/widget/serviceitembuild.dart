import 'package:flutter/material.dart';
import 'package:wingbank/models/serviceitem.dart';

class ServiceItembuild extends StatelessWidget {
  // const Serviceitembuild({super.key});

  const ServiceItembuild({super.key, required this.item});

  final ServiceItem item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(
        //   context,
        // ).push(MaterialPageRoute(builder: (context) => Testing()));
      },
      child: Column(
        children: [
          Expanded(
            // service icon
            child: Image.asset(
              item.image,
              fit: BoxFit.contain,

              width: double.infinity,
            ),
          ),
          // title icon
          Text(item.title, style: TextStyle(fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}
