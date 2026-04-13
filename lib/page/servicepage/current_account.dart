import 'package:flutter/material.dart';
import 'package:wingbank/models/custombts.dart';

class CurrentAccount extends StatefulWidget {
  const CurrentAccount({super.key});

  @override
  State<CurrentAccount> createState() => _CurrentAccountState();
}

class _CurrentAccountState extends State<CurrentAccount> {
  @override
  int selectedIndex = 0;
  final List<String> _filters = [
    'All',
    'Goal',
    'Term Deposit',
    'Current',
    'Saving',
  ];
  Widget build(BuildContext context) {
    return Scaffold(
    );
}
}
