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
      // body: Column(children: [_buildHeader(), _buildService()]),
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

  // Widget _buildHeader() {
  //   return Container(
  //     width: double.infinity,
  //     decoration: const BoxDecoration(
  //       gradient: LinearGradient(
  //         begin: Alignment.topLeft,
  //         end: Alignment.bottomRight,
  //         colors: [primaryGreen, darkGreen],
  //       ),
  //     ),
  //     child: Padding(
  //       padding: const EdgeInsetsDirectional.symmetric(
  //         horizontal: 5.0,
  //         vertical: 12.0,
  //       ),
  //       child: SafeArea(
  //         bottom: false,
  //         child: Row(
  //           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             // menu icon
  //             GestureDetector(
  //               onTap: () {
  //                 _scaffoldKey.currentState?.openDrawer();
  //               },
  //               child: const Icon(Icons.menu, color: Colors.white, size: 30.0),
  //             ),
  //             // wing logo
  //             Container(
  //               // padding: EdgeInsets.only(right: 30.0),
  //               margin: EdgeInsets.only(right: 0.0),
  //               child: Image.asset(
  //                 'lib/images/wing.png',
  //                 width: 200,
  //                 height: 50,
  //                 fit: BoxFit.cover,
  //               ),
  //             ),
  //             Container(
  //               padding: EdgeInsets.only(left: 70.0),
  //               // margin: EdgeInsets.only(right: 20.0),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.end,
  //                 children: [
  //                   // khmerQr
  //                   GestureDetector(
  //                     onTap: () {
  //                       showDialog(
  //                         context: context,
  //                         builder: (BuildContext context) {
  //                           return AlertDialog(
  //                             title: const Text('khmerQr Clicked'),
  //                             content: const Text('khmerQr was clicked'),
  //                             actions: <Widget>[
  //                               TextButton(
  //                                 child: const Text('OK'),
  //                                 onPressed: () {
  //                                   Navigator.of(context).pop();
  //                                 },
  //                               ),
  //                             ],
  //                           );
  //                         },
  //                       );
  //                     },
  //                     child: Image.asset(
  //                       'lib/images/khmerqr.png',
  //                       width: 40,
  //                       height: 50,
  //                       fit: BoxFit.cover,
  //                     ),
  //                   ),
  //                   // Rinng
  //                   SizedBox(width: 8),
  //                   GestureDetector(
  //                     onTap: () {
  //                       showDialog(
  //                         context: context,
  //                         builder: (BuildContext context) {
  //                           return AlertDialog(
  //                             title: const Text('Ring Clicked'),
  //                             content: const Text('Ring was clicked'),
  //                             actions: <Widget>[
  //                               TextButton(
  //                                 child: const Text('OK'),
  //                                 onPressed: () {
  //                                   Navigator.of(context).pop();
  //                                 },
  //                               ),
  //                             ],
  //                           );
  //                         },
  //                       );
  //                     },
  //                     child: Image.asset(
  //                       'lib/images/ringwing.png',
  //                       width: 30,
  //                       height: 40,
  //                       fit: BoxFit.cover,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildDrawer() {
    return Drawer();
  }

  Widget _buildService() {
    return SizedBox(
      height: 400,
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
}
