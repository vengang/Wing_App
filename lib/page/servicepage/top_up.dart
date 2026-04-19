import 'package:flutter/material.dart';
import 'package:wingbank/state_models/isSelected.dart';
import 'package:wingbank/widget/custtomGridVoucher.dart';

class TopUp extends StatefulWidget {
  const TopUp({super.key});

  @override
  State<TopUp> createState() => _TopUpState();
}

enum TopUpType { phone, voucher }

class _TopUpState extends State<TopUp> {
  int selectedValue = 1;
  TopUpType _selectedTyper = TopUpType.phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFa9cb39),
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        centerTitle: true,
        title: Text('Phone Top Up'),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Color(0xFFEBECEE),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Card(
                    // padd edge of card
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 8,
                      ),
                      // row for item
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedTyper = TopUpType.phone;
                                });
                              },
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: _selectedTyper == TopUpType.phone
                                      ? Color(0xFFa9cb39)
                                      : null,
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.phone_android_rounded,
                                        size: 28,
                                        color: _selectedTyper == TopUpType.phone
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Phone Number',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              _selectedTyper == TopUpType.phone
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedTyper = TopUpType.voucher;
                                });
                              },
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  color: _selectedTyper == TopUpType.voucher
                                      ? Color(0xFFa9cb39)
                                      : null,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.phone_android_rounded,
                                        size: 28,
                                        color:
                                            _selectedTyper == TopUpType.voucher
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Buy a Voucher',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              _selectedTyper ==
                                                  TopUpType.voucher
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // my account
                  Positioned(
                    top: 0,
                    child: SizedBox(
                      height: _selectedTyper == TopUpType.phone ? 280 : 450,
                      // card control size
                      child: Card(
                        color: Colors.white,
                        margin: EdgeInsets.only(top: 8),
                        child: Padding(
                          padding: EdgeInsets.all(14),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('My Account'),
                              SizedBox(height: 10),
                              _buildHeader(),
                              SizedBox(height: 10),
                              // the middless text
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF6F7F9),
                                ),
                                width: MediaQuery.of(context).size.width,
                                child: Text('TOP UP TO'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                child: _selectedTyper == TopUpType.phone
                                    ? Text('Phone Numbers')
                                    : null,
                              ),

                              // option to choose phone or voucher
                              _selectedTyper == TopUpType.phone
                                  ? _phoneNumber()
                                  : _voucherTopUp(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return GestureDetector(
      onTap: _buildBtsSheet,
      child: SizedBox(
        width: double.infinity,
        child: Card(
          color: Color(0xFFF0F1F6),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 9, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '093587414',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down, size: 35, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }
  //======================

  Widget _phoneNumber() {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: Card(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                prefixIcon: Icon(
                  Icons.phone_android_rounded,
                  color: Color(0xFF1E88E5),
                  size: 28,
                ),
                suffixIcon: Icon(
                  Icons.contact_page_outlined,
                  color: Color(0xFF1E88E5),
                  size: 30,
                ),
              ),
              keyboardType: TextInputType.phone,
              cursorHeight: 28,
            ),
          ),
        ),
      ),
    );
  }

  // ========
  Widget _voucherTopUp() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomContainerVoucher(
                title: "CellCard",
                imageUrl:
                    'https://upload.wikimedia.org/wikipedia/commons/c/cd/Cellcard.jpg',
              ),

              CustomContainerVoucher(
                title: "Metfone",
                imageUrl:
                    'https://bongsrey.sgp1.digitaloceanspaces.com/library/5646/images/642699c3539a5.png',
              ),
              CustomContainerVoucher(
                title: "Cootel",
                imageUrl:
                    'https://media.licdn.com/dms/image/v2/C4D0BAQEw8Ad3SKu7QA/company-logo_200_200/company-logo_200_200/0/1631322165764?e=2147483647&v=beta&t=Cx6elNZhD8YdZwStu6WnPI348VX-S7h8j0uq9Jf57nw',
              ),
            ],
          ),

          // SizedBox(width: 20),
          Column(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomContainerVoucher(
                title: "Smart",
                imageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlSeaLFGZNVR9hp1YFZDV4oiy9kICQlRhf8g&s',
              ),
              CustomContainerVoucher(
                title: "Seatel",
                imageUrl:
                    'https://www.khmertimeskh.com/wp-content/uploads/2018/09/41474040_1968319579910358_3351402894199881728_n.jpg',
              ),
            ],
          ),
          // SizedBox(width: 5),
        ],
      ),
    );
  }

  // ==============
  // Bottom Sheet
  void _buildBtsSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SizedBox(
          height: 250,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Text(
                  'Choose Account',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 15),

                Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 4),

                      // leading of list
                      leading: Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Radio(
                          value: 1,
                          groupValue: selectedValue,
                          activeColor: Colors.blue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value!;
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ),

                      title: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Current Account',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),

                          SizedBox(width: 6),

                          Flexible(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.blueAccent,
                              ),
                              child: Text(
                                'Default USD',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),

                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // acc num
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              '093 587 414 (USD)',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          // amout of acc
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              '\$0.00',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      onTap: () {
                        setState(() {
                          selectedValue = 1;
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
