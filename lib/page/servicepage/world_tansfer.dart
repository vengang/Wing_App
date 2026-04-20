import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WorldTansfer extends StatefulWidget {
  const WorldTansfer({super.key});

  @override
  State<WorldTansfer> createState() => _WorldTansferState();
}

class _WorldTansferState extends State<WorldTansfer> {
  int selectedValue = 1;
  Country? _selectedCountry;
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
        title: Text('Wing Bank To World'),
      ),

      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .9,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
          // midle text
          Positioned(
            top: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 260,
              // card control size
              child: Card(
                color: Colors.white,
                margin: EdgeInsets.only(top: 25, left: 20, right: 20),
                child: Padding(
                  padding: EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('My Account'),
                      SizedBox(height: 10),
                      _buildHeader(),
                      SizedBox(height: 57),
                      footerCard(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // the middless text
          Positioned(
            top: 140,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(color: Color(0xFFF6F7F9)),
              width: MediaQuery.of(context).size.width,
              child: Text('TO COUNTRY'),
            ),
          ),
          // send bts
          Positioned(
            top: 280,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF007AFF),
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 12),
              ),
              onPressed: () {},
              child: Text(
                'SEND',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
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
        height: 60,
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

  Widget footerCard() {
    return GestureDetector(
      onTap: () {
        showCountryPicker(
          context: context,
          showPhoneCode: false,
          countryListTheme: CountryListThemeData(
            bottomSheetHeight: 760,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            inputDecoration: InputDecoration(
              labelText: 'Search',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                  color: const Color(0xFF8C98A8).withValues(alpha: .2),
                ),
              ),
            ),
          ),
          onSelect: (Country country) {
            setState(() {
              _selectedCountry = country;
            });
          },
        );
      },
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: Card(
          color: Color(0xFFF0F1F6),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 9, horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _selectedCountry != null
                    ? Text(
                        _selectedCountry!.flagEmoji,
                        style: TextStyle(fontSize: 25),
                      )
                    : Icon(Icons.public, color: Color(0xFF007AFF), size: 25),
                // name of country
                _selectedCountry != null
                    ? Text(
                        _selectedCountry!.name,
                        style: TextStyle(fontSize: 20),
                      )
                    : Text('Select Country', style: TextStyle(fontSize: 18)),
                SizedBox(width: 075),
                Icon(
                  Icons.border_color_rounded,
                  size: 25,
                  color: Color(0xFF007AFF),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
