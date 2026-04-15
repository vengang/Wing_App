import 'package:flutter/material.dart';
import 'package:wingbank/models/custombts.dart';

class CurrentAccount extends StatefulWidget {
  const CurrentAccount({super.key});

  @override
  State<CurrentAccount> createState() => _CurrentAccountState();
}

class _CurrentAccountState extends State<CurrentAccount> {
  @override
  int selectedIndex = 0;
  final List<String> _filters = [
    'All',
    'Goal',
    'Term Deposit',
    'Current',
    'Saving',
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFa9cb39),
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        centerTitle: true,
        title: Text('My Account', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFFa9cb39),
      ),
      body: Column(children: [_buildHeader(), _buildBody()]),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Color(0xFFa9cb39),
      height: 250,
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          // chart
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 160,
                  height: 70,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      width: 160,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: .05),
                        // border: BoxBorder.all(),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\u17DB0',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            'Total Balance: \u17DB 0',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: 160,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: .05),
                        // border: BoxBorder.all(),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\$0.00',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            'Total Balance: \$0.00',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      // clipBehavior: Clip.antiAliasWithSaveLayer,
      padding: EdgeInsets.all(8),
      height: 499,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: SizedBox(
        height: 70,
        child: Column(
          children: [
            // build wing coin
            ListTile(
              leading: Icon(Icons.brightness_1_rounded, color: Colors.amber),
              title: Text('Wingpoint:'),
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 5),
            // fitter and button
            Container(
              padding: EdgeInsets.all(8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(_filters.length, (index) {
                    return Custombts(
                      text: _filters[index],
                      isSelected: selectedIndex == index,
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    );
                  }),
                ),
              ),
            ),
            Card(
              // decoration: BoxDecoration(
              //   border: Border.all(
              //     color: Colors.grey.shade300,
              //     style: BorderStyle.solid,
              //   ),
              //   borderRadius: BorderRadius.circular(10),
              // ),
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // LEFT SIDE
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Current',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 1,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Text(
                                      'Default USD',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Text('Current | 093587414'),
                            ],
                          ),
                        ),

                        // more menu + balance
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(Icons.more_horiz_outlined, size: 25),
                            SizedBox(height: 10),
                            Text(
                              '\$0.00',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
