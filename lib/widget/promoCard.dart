import 'package:flutter/material.dart';
import 'package:wingbank/models/promoCardItem.dart';

class Promocard extends StatelessWidget {
  final PromoCard item;

  const Promocard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      width: MediaQuery.of(context).size.width * .3,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: item.gradient,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: item.gradient.last.withValues(alpha: 0.4),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        // Decorative circle — bottom right
        Positioned(
          bottom: -20,
          right: -20,
          child: Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: 0.08),
            ),
          ),
        ),
        // Decorative circle — top left
        Positioned(
          top: -15,
          left: -15,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: 0.06),
            ),
          ),
        ),
        // Content
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Title
              Text(
                item.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),

              // alignment: Alignment.bottomRight,
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  item.icon,
                  width: double.infinity,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
