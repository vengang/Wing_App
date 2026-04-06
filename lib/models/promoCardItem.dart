import 'package:flutter/material.dart';
import 'appcolor.dart';

class PromoCard {
  // Use final for data models to ensure immutability
  final List<Color> gradient;
  final String title;
  final String icon;

  // Use a const constructor for better performance
  PromoCard(this.gradient, this.title, this.icon);
}

final List<PromoCard> promoCards = [
  PromoCard(
    AppColors.wingPlusGradient,
    'Wing+',
    'lib/images/wingplus.png', // Removed 'lib/' and fixed 'wingplush'
  ),
  PromoCard(
    AppColors.offersGradient,
    'Choose\nYour Offers',
    'lib/images/chooseyouroffers.png',
  ),
  PromoCard(
    AppColors.wingpointsGradient,
    'Earn\nWingpoints',
    'lib/images/earnwingpoints.png', // Fixed typo: 'eran' -> 'earn'
  ),
  PromoCard(
    AppColors.prizesGradient,
    'Check\nYour Prizes',
    'lib/images/checkyourprizes.png',
  ),
  PromoCard(
    AppColors.ticketsGradient,
    'Check\nYour Tickets',
    'lib/images/checkyourticket.png',
  ),
  PromoCard(
    AppColors.cbcGradient,
    'CBC\nReport',
    'lib/images/cbcreport.png', // Fixed typo: 'cbe' -> 'cbc'
  ),
];
