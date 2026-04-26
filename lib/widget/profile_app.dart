import 'package:flutter/material.dart';

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFa9cb39),
      appBar: AppBar(
        backgroundColor: const Color(0xFFa9cb39),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Center(
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                  "https://i.pinimg.com/236x/17/df/a9/17dfa916f8e4ca133dbbf0b4fbf76c3c.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 24),

          // White card
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Personal Information',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF111827),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    _InfoRow(
                      icon: Icons.person_outline,
                      label: 'Full Name',
                      value: 'WINGBANK APP',
                    ),
                    _InfoRow(icon: Icons.male, label: 'Gender', value: 'Male'),
                    _InfoRow(
                      icon: Icons.favorite,
                      label: 'Marital Status',
                      value: 'Single',
                    ),
                    _InfoRow(
                      icon: Icons.cake_outlined,
                      label: 'Date of Birth',
                      value: '16-06-2006',
                    ),
                    _InfoRow(
                      icon: Icons.location_on_outlined,
                      label: 'Place of Birth',
                      value: 'ANLONGORK, SOKONG, KONGMEAS, KOMPONG CHAM',
                    ),
                    _InfoRow(
                      icon: Icons.flag_outlined,
                      label: 'Nationality',
                      value: 'KH',
                    ),
                    _InfoRow(
                      icon: Icons.phone_outlined,
                      label: 'Mobile Number',
                      value: '0965181067',
                    ),
                    _InfoRow(
                      icon: Icons.email_outlined,
                      label: 'Email Address',
                      value: 'N/A',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF8DC63F), size: 22),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(fontSize: 13, color: Color(0xFF9CA3AF)),
                ),
                SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF111827),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
