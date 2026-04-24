import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Qrscan extends StatelessWidget {
  const Qrscan({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //logo
            _buildLogo(),
            SizedBox(height: 10),
            _title(),

            _buildQrimg(),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      width: 220,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 35),
              'Wing Bank',
            ),
          ),
        ],
      ),
    );
  }

  Widget _title() {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0),
      child: Text(
        maxLines: 2,
        'Show QR code to make a secure and fast payment',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontSize: 18,
          color: Colors.white,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }

  Widget _buildQrimg() {
    return SizedBox(
      height: 460,
      child: Image.asset('lib/images/qr.png', fit: BoxFit.cover),
    );
  }
}
