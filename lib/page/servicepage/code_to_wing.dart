import 'package:flutter/material.dart';

class CodeToWing extends StatefulWidget {
  const CodeToWing({super.key});

  // const CodeToWing({super.key, required this.imgurl, required this.title});

  @override
  State<CodeToWing> createState() => _CodeToWingState();
}

class _CodeToWingState extends State<CodeToWing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFa9cb39),
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        centerTitle: true,
        title: Text("Code To Wing"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 1),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF6F7F9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsGeometry.all(20),
                  child: ListView(
                    children: [
                      Text(
                        "Wei luy Xpress",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      SizedBox(height: 8),
                      customCard(
                        "https://i.pinimg.com/474x/9f/a7/c3/9fa7c33a0cd4d96bfb30b7cf5fd6d3ab.jpg",
                        "Wing",
                      ),
                      SizedBox(height: 8),
                      Text(
                        "International Remittance",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      customCard(
                        "https://cdn-icons-png.flaticon.com/512/825/825482.png",
                        "Western Union",
                      ),
                      SizedBox(height: 8),
                      customCard(
                        "https://cdn-icons-png.flaticon.com/512/825/825503.png",
                        "Money Gram",
                      ),
                      SizedBox(height: 8),
                      customCard(
                        "https://images.seeklogo.com/logo-png/25/2/ria-money-transfer-logo-png_seeklogo-251809.png",
                        "Ria",
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Partner's Redemption",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      customCard(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTAbIueb6DAeo3mCoTFxrTBpShPwRU0vIluA&s",
                        "My Boy",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // custom card widget
  Widget customCard(String imgurl, String title) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.white,
      elevation: .2,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            // to put immg
            CircleAvatar(
              maxRadius: 20,
              backgroundColor: Colors.white,
              // child: Image.network(imgurl, fit: BoxFit.cover),
              backgroundImage: NetworkImage(imgurl),
            ),
            // title
            SizedBox(width: 20),
            Text(title, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
