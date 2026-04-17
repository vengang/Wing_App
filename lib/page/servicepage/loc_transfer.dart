import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LocTransfer extends StatefulWidget {
  const LocTransfer({super.key});

  @override
  State<LocTransfer> createState() => _LocTransferState();
}

class _LocTransferState extends State<LocTransfer> {
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
        title: Text('Local Transfer', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFFa9cb39),
      ),
      body: Column(children: [_buildHeader(), _buildBody()]),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 240,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(color: Color(0xFFa9cb39)),

      child: Row(
        children: [
          Expanded(
            child: Image.asset(
              'lib/images/locTransferimg.png',
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.all(8),
      height: 509,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TranferOption(
              label: 'Tranfer To Own Account',
              leftIcon: Icons.account_circle_rounded,
              rightIcon: Icons.account_circle_rounded,
              arrowStyle: ArrowStyle.double,
            ),
            TranferOption(
              label: 'Wing Bank to Wing Bank',
              leftIcon: Icons.flight,
              rightIcon: Icons.flight,
              arrowStyle: ArrowStyle.double,
            ),
            TranferOption(
              label: 'Wing Bank to Other Bank',
              leftIcon: Icons.flight,
              rightIcon: Icons.account_balance,
              arrowStyle: ArrowStyle.double,
            ),
            TranferOption(
              label: 'Wing Wei Luy',
              leftIcon: Icons.flight,
              rightIcon: Icons.smartphone,
              arrowStyle: ArrowStyle.double,
            ),
            TranferOption(
              label: 'Trading Account',
              leftIcon: Icons.flight,
              rightIcon: Icons.candlestick_chart,
              arrowStyle: ArrowStyle.single,
            ),
          ],
        ),
      ),
    );
  }
}

// local tranfers option
enum ArrowStyle { single, double }

class TranferOption extends StatelessWidget {
  final String label;
  final IconData leftIcon;
  final IconData rightIcon;
  final ArrowStyle arrowStyle;

  const TranferOption({
    super.key,
    required this.label,
    required this.leftIcon,
    required this.rightIcon,
    required this.arrowStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        onTap: () {},
        child: Card(
          margin: EdgeInsets.only(top: 15),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 18, horizontal: 10),
            child: Row(
              children: [
                //for left icon
                FaIcon(leftIcon, color: Color(0xFF1E88E5), size: 35),

                SizedBox(width: 5),

                //arrow
                Icon(
                  arrowStyle == ArrowStyle.single
                      ? Icons.arrow_back_sharp
                      : Icons.arrow_forward,
                  color: Color(0xFF1E88E5),
                  size: 35,
                ),

                SizedBox(width: 5),

                // right icon
                Icon(rightIcon, color: Color(0xFF1E88E5), size: 35),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
