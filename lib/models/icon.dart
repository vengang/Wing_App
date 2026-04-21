import 'package:flutter/material.dart';

class AppIcons {
  static const IconData home = Icons.home_outlined;
  static const IconData referFriends = Icons.group_add_outlined;
  static const IconData locator = Icons.location_on_outlined;
  static const IconData about = Icons.info_outline;
  static const IconData faqs = Icons.help_outline;
  static const IconData contactUs = Icons.headset_mic_outlined;
  static const IconData terms = Icons.assignment_outlined;
  static const IconData settings = Icons.settings_outlined;
}

// contact page about
class ContactItem {
  final String title;
  final IconData icon;

  ContactItem(this.title, this.icon);
}

class BillIcon {
  final String name;
  final IconData icon;

  BillIcon({required this.name, required this.icon});
}

final List<BillIcon> billIcons = [
  BillIcon(name: "Utilities", icon: Icons.electrical_services),
  BillIcon(name: "Finance", icon: Icons.account_balance),
  BillIcon(name: "Insurance", icon: Icons.security),
  BillIcon(name: "Internet and TV", icon: Icons.tv),
  BillIcon(name: "School", icon: Icons.school),
  BillIcon(name: "SME Business Payment", icon: Icons.business_center),
  BillIcon(name: "Donation & Charity", icon: Icons.volunteer_activism),
  BillIcon(name: "Postpaid", icon: Icons.phone),
  BillIcon(name: "Others", icon: Icons.more_horiz),
];
