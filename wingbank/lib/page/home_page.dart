import 'package:flutter/material.dart';
import 'package:wingbank/models/serviceitem.dart';
import 'package:wingbank/widget/serviceitembuild.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isclick = false;
  static const Color primaryGreen = Color(0xFFa9cb39);
  static const Color darkGreen = Color(0xFF93df41);
  static const Color primaryBlue = Color(0xFF1565C0);
  static const Color lightBlue = Color(0xFF1E88E5);
  static const Color accentBlue = Color(0xFF0D47A1);
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar,
      drawer: _buildDrawer(),
      body: _buildBody,
    );
  }

  AppBar get _buildAppBar {
    return AppBar(
      backgroundColor: Color(0xFFa9cb39),
      title: Image.asset(
        'lib/images/wing.png',
        width: 130,
        height: 200,
        fit: BoxFit.cover,
      ),
      actions: [
        // wingpoint
        GestureDetector(
          child: Image.asset(
            'lib/images/wingpoint.png',
            width: 40,
            height: 90,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 10),
        // khmerQr
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('khmerQr Clicked'),
                  content: const Text('khmerQr was clicked'),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Image.asset(
            'lib/images/khqr.png',
            width: 40,
            height: 90,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          child: Image.asset(
            'lib/images/ringwing.png',
            width: 30,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }

  Widget get _buildBody {
    return Container(
      color: primaryGreen,
      child: ListView(
        children: [
          Flexible(
            flex: 4,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: accentBlue),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
            ),
          ),
          Flexible(flex: 1, child: _buildService),
          Flexible(flex: 1, child: Container(height: 150, color: Colors.grey)),
          Flexible(
            flex: 1,
            child: Container(height: 150, color: Colors.lightBlue),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer();
  }

  Widget get _buildService {
    return Container(
      color: Color(0xFFFFFFFF),
      height: 250,
      child: GridView.builder(
        itemCount: serviceItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.0,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
        itemBuilder: (context, index) {
          ServiceItem item = serviceItems[index];
          return Serviceitembuild();
        },
      ),
    );
  }

  Widget get _buildNotification {
    return Container(height: 150, color: Colors.yellow);
  }
}
