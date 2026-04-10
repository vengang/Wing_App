import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(null),
        backgroundColor: Color(0xFFa9cb39),
        centerTitle: true,
        title: Text('Help'),
      ),
      body: Center(child: Text('Help Page')),
    );
  }
}
