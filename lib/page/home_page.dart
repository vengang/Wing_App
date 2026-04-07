import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wingbank/models/appcolor.dart';
import 'package:wingbank/models/datapromotion.dart';
import 'package:wingbank/models/icon.dart';
import 'package:wingbank/models/promoCardItem.dart';
import 'package:wingbank/models/serviceitem.dart';
import 'package:wingbank/widget/aboutPage.dart';
import 'package:wingbank/widget/locatorPage.dart';
import 'package:wingbank/widget/promoCard.dart';
import 'package:wingbank/widget/protiondata.dart';
import 'package:wingbank/widget/referpage.dart';
import 'package:wingbank/widget/serviceitembuild.dart';
import 'package:wingbank/widget/setting.dart';
import 'package:wingbank/widget/termPage.dart';

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
      drawer: _buildDrawer,
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
          Flexible(
            flex: 1,
            child: Container(color: Colors.white, child: _buildPromotionsBody),
          ),
        ],
      ),
    );
  }

  Widget get _buildDrawer {
    return Drawer(
      child: Column(
        children: [
          /// 🔰 TOP LOGO
          Container(
            width: double.infinity,
            height: 140,
            color: darkGreen,
            alignment: Alignment.center,
            child: Image.asset("lib/images/wing.png", height: 40),
          ),

          /// 👤 USER INFO
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: primaryBlue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("lib/images/profile.png"),
                    ),
                    const SizedBox(width: 15),

                    /// TEXT INFO
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Seang Kimsour",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Current Account",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "#010829656",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                /// VIEW PROFILE
                Row(
                  children: const [
                    Text("View Profile", style: TextStyle(color: Colors.white)),
                    Icon(Icons.arrow_right, color: Colors.white),
                  ],
                ),
              ],
            ),
          ),

          /// 📋 MENU LIST
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              children: [
                buildMenuItem(
                  context,
                  icon: AppIcons.home,
                  title: "Home",
                  page: const HomePage(),
                ),

                buildMenuItem(
                  context,
                  icon: AppIcons.referFriends,
                  title: "Refer Friends",
                  page: Referpage(),
                ),

                buildMenuItem(
                  context,
                  icon: AppIcons.locator,
                  title: "Locator",
                  page: LocatorPage(),
                ),

                buildMenuItem(
                  context,
                  icon: AppIcons.about,
                  title: "About",
                  page: Aboutpage(),
                ),

                buildMenuItem(
                  context,
                  icon: AppIcons.terms,
                  title: "Terms & Conditions",
                  page: Termpage(),
                ),

                buildMenuItem(
                  context,
                  icon: AppIcons.settings,
                  title: "Setting",
                  page: Setting(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationBanner() {
    return Container(
      height: 12,
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
      height: 290,
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
    return CarouselSlider.builder(
      itemCount: promotionItem.length,
      itemBuilder: (context, index, viewport) {
        Promotiondata item = promotionItem[index];
        return pro(item: item);
      },
      options: CarouselOptions(
        scrollPhysics: BouncingScrollPhysics(),
        height: 130,
        autoPlay: true,
      ),
    );
  }
}

Widget buildMenuItem(
  BuildContext context, {
  required IconData icon,
  required String title,
  required Widget page,
}) {
  return ListTile(
    leading: Icon(icon, size: 28, color: Colors.black87),
    title: Text(title, style: const TextStyle(fontSize: 15)),
    onTap: () {
      Navigator.pop(context); // close drawer

      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    },
  );
}
