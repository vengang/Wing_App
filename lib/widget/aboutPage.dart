import 'package:flutter/material.dart';
import 'package:wingbank/models/IconPicture.dart';
import 'package:wingbank/models/appcolor.dart';
import 'package:wingbank/models/icon.dart';

class Aboutpage extends StatelessWidget {
  const Aboutpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 119, 189, 44),
        leading: Icon(Icons.arrow_back_ios, color: AppColors.bgGrey),
        title: Text("About", style: TextStyle(color: AppColors.bgGrey)),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildDiscribtion(),
          SizedBox(height: 10),
          _buildContectus(),
          SizedBox(height: 15),
          _buildLearnMore(),
        ],
      ),
    );
  }

  Widget _buildDiscribtion() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          width: 370,
          height: 560,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 5),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    AppImages.aboutimage,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Image.asset(
                  AppImages.wingLogo2,
                  width: 100,
                  height: 70,
                  fit: BoxFit.cover,
                ),
                Text(
                  "The Wing Bank App is a comprehensive application provided by Wing Bank that enables users to manage their finances in one place. It allows users to scan and pay using any bank's KHQR code, transfer money locally and internationally, top-up mobile balances, pay bills, and, most importantly, earn endless Wingpoints.",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  "Powered by Cambodia's leading banking services, the Wing Bank app ensures not just faster and easier transactions, but also the utmost security for all Wing Bank users, giving you peace of mind with every transaction!",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContectus() {
    final List<ContactItem> items = [
      ContactItem("Online Call", Icons.call),
      ContactItem("Call 023 999 989", Icons.call),
      ContactItem("Help", Icons.chat),
      ContactItem("Care Centre", Icons.email),
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Contact Us",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10),

          /// 🔥 ListView بدل repeating code
          ListView.builder(
            itemCount: items.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final item = items[index];
              return _contactButton(item);
            },
          ),
        ],
      ),
    );
  }

  Widget _contactButton(ContactItem item) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(item.icon, color: Colors.blue),
          const SizedBox(width: 10),
          Text(
            item.title,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLearnMore() {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Learn More About Wing Bank",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 15),

          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: pic.length,
              itemBuilder: (context, index) {
                final item = pic[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(item.image, fit: BoxFit.contain),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(item.title),
                    ],
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          const Center(
            child: Text(
              "App version: 4.18.12",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
