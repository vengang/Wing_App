import 'package:flutter/material.dart';
import 'package:wingbank/page/home_page.dart';

class Help extends StatefulWidget {
  const Help({super.key});
  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  TimeOfDay _selectedTime = TimeOfDay.now();
  DateTime _selectedDate = DateTime.now();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => HomePage())),
          child: Icon(Icons.arrow_back_rounded, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(Icons.call_outlined, color: Colors.white),
          ),
        ],
        backgroundColor: Color(0xFFa9cb39),
        centerTitle: true,
        title: Text(
          'Help',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView(
              children: [
                today(_selectedDate),
                _buildChatBot(
                  'សួស្តី​​ ខ្ញុំគឺជា Wing Chat Bot! ជំនួយការផ្ទាល់ខ្លួនរបស់អ្នក​​ ដែលអាចផ្តល់ព័ត៏មានពាក់ព័ន្ធទៅនឹងធនាគារ​ ​វីង។​ អ្នកអាចសួរមកកាន់ខ្ញុំដោយផ្ទាល់',
                  _selectedTime,
                ),
                _buildChatBot(
                  'ប្រសិនបេីអ្នកចង់បញ្ចប់ការសន្ទនាសូមវាយពាក្យ "Bye"',
                  _selectedTime,
                ),
              ],
            ),
          ),
          _buildInputBar(),
        ],
      ),
    );
  }

  Widget _buildChatBot(String text, TimeOfDay _selectedTime) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 50, vertical: 5),
      child: Container(
        padding: EdgeInsetsGeometry.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(text, style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text(_selectedTime.format(context)),
          ],
        ),
      ),
    );
  }

  Widget today(DateTime _selectedDate) {
    return SizedBox(
      height: 40,
      child: Center(
        child: Text(
          '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
        ),
      ),
    );
  }

  Widget _buildInputBar() {
    return Container(
      width: double.infinity,
      height: 140,
      // decoration: BoxDecoration(color: Colors.grey.withValues(alpha: .2)),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.attach_file_outlined, color: Colors.grey),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.chat_bubble_outline, color: Colors.grey),
          ),
          SizedBox(width: 10),

          // text chaat
          Expanded(
            child: Container(
              height: 50,
              padding: EdgeInsetsGeometry.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: .2),
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  'Type a message here',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          // mic)
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.mic_none_outlined, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
