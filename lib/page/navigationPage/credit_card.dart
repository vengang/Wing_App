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
          'Manage Cards',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: Color(0xFFa9cb39),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            //bg layout
            Column(
              children: [
                SizedBox(height: 70),

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // card container
            Positioned(
              top: 15,
              child: Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            //add card
            Positioned(
              top: 85,
              child: OutlinedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  iconSize: 50,
                  shape: CircleBorder(),
                  elevation: 0,
                  side: BorderSide(color: Colors.white, width: 4),
                  foregroundColor: Colors.blue,
                  iconColor: Colors.white,
                ),
                child: Icon(Icons.add),
              ),
            ),
            // card text
            Positioned(
              top: 150,
              child: Text(
                'New Card',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // center text
            Positioned(
              top: 380,
              child: Column(
                children: [
                  Text(
                    'Add Card',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'To add link a new card, please tap on',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.withValues(alpha: 1),
                    ),
                  ),
                  Text(
                    '(+) button above.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.withValues(alpha: 1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
