import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Qrscan extends StatelessWidget {
  const Qrscan({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //logo
          _buildLogo(),
          SizedBox(height: 5),
          _title(),
          _buildQrimg(),
          _buildReciveAccount(),
          _buildEnterAmout(),
          SizedBox(height: 10),
          _buildQrOption(),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // padding: EdgeInsets.all(12),
        width: 190,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Image.asset(
          'lib/images/winglogo3.png',
          fit: BoxFit.cover,
          // scale: double.maxFinite,
        ),
      ),
    );
  }

  Widget _title() {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0),
      child: Text(
        'Show QR code to make a secure and fast payment',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontSize: 15,
          color: Colors.white,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }

  Widget _buildQrimg() {
    return SizedBox(
      height: 450,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Image.asset(
          'lib/images/qr.png',
          fit: BoxFit.cover,
          scale: double.maxFinite,
        ),
      ),
    );
  }

  Widget _buildReciveAccount() {
    return Padding(
      padding: EdgeInsetsGeometry.all(12),
      child: Text(
        maxLines: 2,
        'Receive to: 093587414 (KHR)',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontSize: 15,
          color: Colors.white,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }

  Widget _buildEnterAmout() {
    return Container(
      padding: EdgeInsets.all(12),
      width: 320,
      height: 60,
      decoration: BoxDecoration(
        color: Color.fromARGB(152, 92, 101, 100),
        borderRadius: BorderRadius.all(Radius.circular(28)),
      ),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          'Enter Amount',
          style: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontSize: 15,
            color: Colors.white,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }

  Widget _buildQrOption() {
    return Container(
      padding: EdgeInsets.all(12),
      width: 320,
      height: 60,
      decoration: BoxDecoration(
        color: Color.fromARGB(152, 92, 101, 100),
        borderRadius: BorderRadius.all(Radius.circular(28)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          costomIcon(icon: Icons.download, title: 'Save'),
          _divider(),
          costomIcon(icon: Icons.fit_screen_sharp, title: 'Screen Shot'),
          _divider(),
          costomIcon(icon: Icons.share, title: 'Share'),
        ],
      ),
    );
  }
}

class costomIcon extends StatelessWidget {
  final IconData icon;
  final String title;

  const costomIcon({super.key, required this.icon, required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 18, color: Colors.white),

          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _divider() {
  return Container(width: 1.2, height: 30, color: Colors.white);
}
