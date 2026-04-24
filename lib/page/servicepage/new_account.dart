import 'package:flutter/material.dart';

class NewAccount extends StatefulWidget {
  const NewAccount({super.key});

  @override
  State<NewAccount> createState() => _NewAccountState();
}

class _NewAccountState extends State<NewAccount> {
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
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 0,
                bottom: 18,
                right: 18,
                left: 18,
              ),
              // header descrip of contents
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'New Account',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  Text(
                    'You can open a new account and have access to your funds just in seconds.',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
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
    return ListView(
      children: [
        customListView(
          "lib/images/saveforgoal.png",
          "Save for Goal",
          "Save for anything you want and earn interest rate up to 5.00% p.a. plus a special offer for your goal",
          Colors.blue,
        ),
        SizedBox(height: 8),
        customListView(
          "lib/images/termDeposit.png",
          "Term Deposit",
          "Earn a high income up to 5.5% p.a. as interest from your deposit amount",
          Colors.deepPurple,
        ),
        SizedBox(height: 8),
        customListView(
          "lib/images/wallet.png",
          "Savings Account",
          "Earn a high interest rate up to 3.00% p.a. and get paid every month",
          Colors.blue,
        ),
        SizedBox(height: 8),
        customListView(
          "lib/images/wallet.png",
          "Current Account",
          "Move your fund freely up to \$150,000 per day for your daily needs",
          Colors.orange,
        ),
        SizedBox(height: 8),

        Card(
          color: Colors.white,
          shadowColor: Colors.white,
          elevation: .8,
          child: ListTile(
            trailing: Icon(
              Icons.arrow_forward_ios_outlined,
              color: Color(0xFF979CA8),
            ),
            title: Text(
              "Interest Rate Calculator",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }

  Widget customListView(
    String img,
    String title,
    String subtile,
    Color avatarColor,
  ) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.white,
      elevation: .8,
      child: ListTile(
        // contentPadding: EdgeInsets.all(12),
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: CircleAvatar(
            maxRadius: 20,
            backgroundColor: avatarColor,
            backgroundImage: AssetImage(img),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(
          subtile,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_outlined,
          color: Color(0xFF979CA8),
        ),
      ),
    );
  }
}
