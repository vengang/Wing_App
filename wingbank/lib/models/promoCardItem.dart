import 'package:flutter/material.dart';
import 'appcolor.dart';

class PromoCard {
  // Use final for data models to ensure immutability
  final List<Color> gradient;
  final String title;
  final String icon;

  // Use a const constructor for better performance
  const PromoCard({
    required this.gradient,
    required this.title,
    required this.icon,
  });
}

final List<PromoCard> promoCards = [
  const PromoCard(
    gradient: AppColors.wingPlusGradient,
    title: 'Wing+',
    icon: 'assets/images/wingplus.png', // Removed 'lib/' and fixed 'wingplush'
  ),
  const PromoCard(
    gradient: AppColors.offersGradient,
    title: 'Choose\nYour Offers',
    icon: 'assets/images/chooseyouroffers.png',
  ),
  const PromoCard(
    gradient: AppColors.wingpointsGradient,
    title: 'Earn\nWingpoints',
    icon: 'assets/images/earnwingpoints.png', // Fixed typo: 'eran' -> 'earn'
  ),
  const PromoCard(
    gradient: AppColors.prizesGradient,
    title: 'Check\nYour Prizes',
    icon: 'assets/images/checkyourprizes.png',
  ),
  const PromoCard(
    gradient: AppColors.ticketsGradient,
    title: 'Check\nYour Tickets',
    icon: 'assets/images/checkyourticket.png',
  ),
  const PromoCard(
    gradient: AppColors.cbcGradient,
    title: 'CBC\nReport',
    icon: 'assets/images/cbcreport.png', // Fixed typo: 'cbe' -> 'cbc'
  ),
];
