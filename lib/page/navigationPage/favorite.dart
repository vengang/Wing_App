import 'package:flutter/material.dart';
import 'package:wingbank/page/home_page.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(null),
        backgroundColor: Color(0xFFa9cb39),
        centerTitle: true,
        title: Text(
          'Favorite',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/images/favorate.png'),
            SizedBox(height: 20),
            Text('No Favorite'),
            Text('Once you have favorites, they will be displayed here.'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF1E88E5),
        shape: CircleBorder(),
        splashColor: Color(0xFF93df41),
        onPressed: () {},
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
