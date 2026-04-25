import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wingbank/models/appcolor.dart';
import 'package:wingbank/models/datapromotion.dart';
import 'package:wingbank/models/icon.dart';
import 'package:wingbank/models/promoCardItem.dart';
import 'package:wingbank/models/serviceitem.dart';
import 'package:wingbank/page/navigationPage/credit_card.dart';
import 'package:wingbank/page/navigationPage/favorite.dart';
import 'package:wingbank/page/navigationPage/help.dart';
import 'package:wingbank/page/navigationPage/scanbanner.dart';
import 'package:wingbank/page/navigationPage/wallet.dart';
import 'package:wingbank/page/qrscan.dart';
import 'package:wingbank/widget/aboutPage.dart';
import 'package:wingbank/widget/locatorPage.dart';
import 'package:wingbank/widget/profile_app.dart';
import 'package:wingbank/widget/promoCard.dart';
import 'package:wingbank/widget/protiondata.dart';
import 'package:wingbank/widget/referpage.dart';
import 'package:wingbank/widget/serviceitembuild.dart';
import 'package:wingbank/widget/setting.dart';
import 'package:wingbank/widget/termPage.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoadingHelp = false;
  dynamic isclick = false;
  int _currentIndex = 0;
  static const Color primaryGreen = Color(0xFFa9cb39);
  static const Color darkGreen = Color(0xFF93df41);
  static const Color primaryBlue = Color(0xFF1565C0);
  static const Color lightBlue = Color(0xFF1E88E5);
  static const Color accentBlue = Color(0xFF0D47A1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: _buildAppBarBtsNavigation,
      drawer: _buildDrawer,
      body: _btsNavigationBody,
      bottomNavigationBar: _buildBottonNavigation,
      floatingActionButton: _buildFloatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // body build
  Widget get _buildBody {
    return SafeArea(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
        ),
        color: primaryGreen,
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              _buildNotificationBanner(),
              _buildService,
              _buildPromoCard,
              _buildPromotions,
              Container(color: Colors.white, child: _buildPromotionsBody),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _btsNavigationBody {
    return IndexedStack(
      index: _currentIndex,
      children: [
        _buildBody,
        Favorite(),
        Wallet(),
        _isLoadingHelp
            ? Center(child: CircularProgressIndicator())
            : Container(),
        credit_card(),
      ],
    );
  }

  // appbar + bts navigation
  PreferredSizeWidget? get _buildAppBarBtsNavigation {
    if (_currentIndex == 0) {
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

                // barrierColor: Colors.amber,
                fullscreenDialog: false,
                requestFocus: true,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return Qrscan();
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
        // drawer icons color
        iconTheme: IconThemeData(color: Colors.white),
      );
    }
    return null;
  }

  Widget get _buildBottonNavigation {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      // showSelectedLabels: true,
      // showUnselectedLabels: true,
      currentIndex: _currentIndex,
      onTap: (index) async {
        if (index == 3) {
          //show loading
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) =>
                Center(child: CircularProgressIndicator(color: primaryGreen)),
          );
          // wait
          await Future.delayed(Duration(seconds: 1));
          Navigator.pop(context);
          // push to help page
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => Help()));
          setState(() {
            _currentIndex = index;
          });
        } else {
          setState(() {
            _currentIndex = index;
          });
        }
      },
      iconSize: 25,
      elevation: 8,
      selectedItemColor: primaryGreen,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorites"),
        BottomNavigationBarItem(icon: Icon(null), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: 'Help'),
        BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: 'Card'),
      ],
    );
  }

  // flaoting action button
  Widget get _buildFloatingActionButton {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 40),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: BoxBorder.all(color: Colors.white, width: 3),
      ),
      child: FloatingActionButton.large(
        elevation: 0,
        onPressed: () {
          setState(() {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => Scanbanner()));
          });
        },
        backgroundColor: Colors.blue,
        shape: CircleBorder(),
        child: Icon(Icons.qr_code_scanner_outlined, color: Colors.white),
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
            child: Image.asset(
              "lib/images/wing.png",
              height: double.maxFinite,
              fit: BoxFit.cover,
            ),
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
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network(
                          "https://i.pinimg.com/236x/17/df/a9/17dfa916f8e4ca133dbbf0b4fbf76c3c.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),

                    /// TEXT INFO
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "WingBank App",
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
                          "#0965181067",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                /// VIEW PROFILE
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfileApp()),
                        );
                      },
                      child: Text(
                        "View Profile",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Icon(Icons.arrow_right, color: Colors.white),
                  ],
                ),
              ],
            ),
          ),

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
                  page: HomePage(),
                ),

                buildMenuItem(
                  context,
                  icon: AppIcons.locator,
                  title: "Locator",
                  page: HomePage(),
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
                  page: HomePage(),
                ),

                buildMenuItem(
                  context,
                  icon: AppIcons.settings,
                  title: "Setting",
                  page: SettingsApp(),
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
      height: 15,
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
      height: 250,
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: serviceItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          // crossAxisSpacing: 20,
          mainAxisSpacing: 2,
          childAspectRatio: 3 / 1.8,
        ),
        itemBuilder: (context, index) {
          ServiceItem item = serviceItems[index];
          return GestureDetector(
            onTap: () {
              // push each page
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => item.page()));
            },
            child: ServiceItembuild(item: item),
          );
        },
      ),
    );
  }

  Widget get _buildPromoCard {
    return Container(
      color: AppColors.bgGrey,
      padding: const EdgeInsets.only(top: 18, bottom: 15, left: 10, right: 10),
      child: SizedBox(
        height: 160,
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
        height: 180,
        // enlargeCenterPage: true,
        viewportFraction: 0.9,
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
