import 'package:flutter/material.dart';

class credit_card extends StatefulWidget {
  const credit_card({super.key});

  @override
  State<credit_card> createState() => _credit_cardState();
}

class _credit_cardState extends State<credit_card> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(null),
        backgroundColor: Color(0xFFa9cb39),
        centerTitle: true,
        title: Text(
          'credit_card',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: Color(0xFFa9cb39),
        height: 664,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  color: Colors.amber,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha: .1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
