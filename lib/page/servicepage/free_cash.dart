import 'package:flutter/material.dart';
import 'package:wingbank/models/free_cash_data.dart';

class FreeCash extends StatefulWidget {
  @override
  State<FreeCash> createState() => _FreeCashState();
}

class _FreeCashState extends State<FreeCash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFa9cb39),
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 0,
                bottom: 18,
                right: 18,
                left: 18,
              ),
              // header descrip of contents
              child: _buildTitle(),
            ),
          ),
          // body of contents and service
          Flexible(
            flex: 6,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              color: Color(0xFFF5F6F8),
              child: _serviceBuild(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _serviceBuild() {
    return ListView.builder(
      itemCount: plans.length,
      itemBuilder: (context, index) {
        Plan item = plans[index];
        return customListView(item);
      },
    );
  }

  Widget _buildTitle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'free cash out package'.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Enjoy free Cash-Out at any /wing agents nationwide',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        Card(
          elevation: 0,
          color: Colors.white.withValues(alpha: .18),
          margin: EdgeInsets.only(right: 10),
          child: ListTile(
            leading: Icon(Icons.error_outlined, color: Colors.white),
            title: Text(
              'The daily allowed amout and limit are based on your account type.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget customListView(Plan plans) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.white,
      elevation: .8,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 2),
                // child of col
                Text(plans.type),
                SizedBox(height: 2),
                // the second child
                Row(
                  children: [
                    Text(
                      "\$${plans.payPerYear}",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'per year',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 75),
                    Text(
                      "Billed Annually",
                      style: TextStyle(
                        color: Colors.blue,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                //third child
                Text(". Yearly free cash-out limit up to USD ${plans.detail}"),
                SizedBox(height: 3),
                Text(
                  ". Free cash-out up to ${plans.cashOut} times/day and ${plans.benefit}",
                  // style: TextStyle(fontSize: 15),
                ),
                // bts
                SizedBox(height: 5),
                ElevatedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  onPressed: () {},
                  child: Text(
                    'subscribe'.toUpperCase(),
                    style: TextStyle(color: Colors.white),
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
