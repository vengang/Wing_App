import 'package:flutter/material.dart';
import 'package:wingbank/models/appcolor.dart';
import 'package:wingbank/models/promoCardItem.dart';
import 'package:wingbank/models/serviceitem.dart';
import 'package:wingbank/widget/promoCard.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar,
      drawer: _buildDrawer(),
      body: _buildBody,
      bottomNavigationBar: _buildBottonNavigation,
    );
  }

  Widget get _buildBottonNavigation {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      // currentIndex: _currentIndex,
      // onTap: (index) {
      //   setState(() {
      //     _currentIndex = index;
      //   });
      // },
      selectedItemColor: primaryGreen,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet),
          label: 'Wallet',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
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
          Flexible(flex: 4, child: _buildNotificationBanner()),
          Flexible(flex: 1, child: _buildService),
          Flexible(flex: 1, child: _buildPromoCard),
          Flexible(flex: 1, child: _buildPromotions),
          Flexible(flex: 1, child: _buildPromotionsBody),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer();
  }

  Widget _buildNotificationBanner() {
    return Container(
      height: 18,
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
    );
  }

  Widget get _buildService {
    return Container(
      color: Color(0xFFFFFFFF),
      height: 300,
      child: GridView.builder(
        shrinkWrap: false,
        itemCount: serviceItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 3 / 2.1, //3 / //2.2,
        ),
        itemBuilder: (context, index) {
          ServiceItem item = serviceItems[index];
          return ServiceItembuild(item: item);
        },
      ),
    );
  }

  Widget get _buildPromoCard {
    return Container(
      color: AppColors.bgGrey,
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: SizedBox(
        height: 155,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            PromoCard item = promoCards[index];
            return Promocard(item: item);
          },
          itemCount: promoCards.length,
        ),
      ),
    );
  }

  Widget get _buildPromotions {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Promotions',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                InkWell(
                  child: Text(
                    'Show All >',
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get _buildPromotionsBody {
    return Container();
  }
}
