import 'package:flutter/material.dart';
import 'package:wingbank/models/custombts.dart';
import 'dart:math';

class CurrentAccount extends StatefulWidget {
  const CurrentAccount({super.key});

  @override
  State<CurrentAccount> createState() => _CurrentAccountState();
}

class _CurrentAccountState extends State<CurrentAccount>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;

  final List<String> _filters = [
    'All',
    'Goal',
    'Term Deposit',
    'Current',
    'Saving',
  ];

  //Animation
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(
      begin: 0,
      end: 0.9,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: SizedBox(
                    width: 170,
                    height: 170,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Animated Circle
                        AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            return CustomPaint(
                              size: Size(170, 170),
                              painter: RealHalfCirclePainter(_animation.value),
                            );
                          },
                        ),

                        Container(
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            shape: BoxShape.circle,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("1", style: TextStyle(fontSize: 20)),
                              Text(
                                "Account",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 160,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.05),
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
              SizedBox(height: 10),
              Container(
                width: 160,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.05),
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
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: EdgeInsets.all(8),
      height: 563,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              maxRadius: 25,
              backgroundColor: Colors.grey[200],
              backgroundImage: AssetImage('lib/images/wingpoint.png'),
            ),
            title: Text('Wingpoint:'),

            trailing: Icon(Icons.arrow_forward_ios_sharp, color: Colors.blue),
          ),

          SizedBox(height: 5),

          SingleChildScrollView(
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

          SizedBox(height: 10),

          Card(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                children: [
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

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(Icons.more_horiz_outlined),
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
            ),
          ),
        ],
      ),
    );
  }
}

class RealHalfCirclePainter extends CustomPainter {
  final double progress;

  RealHalfCirclePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 32.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - strokeWidth / 2;

    const gapHalf = pi * 0.2;
    const startAngle = pi / 2 + gapHalf;
    const sweepTotal = (2 * pi) - (gapHalf * 2);

    // background (light so animation visible)
    final bgPaint = Paint()
      ..color = const Color(0xFFFF9800).withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepTotal,
      false,
      bgPaint,
    );

    // progress
    final progressPaint = Paint()
      ..color = const Color(0xFFFF9800)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepTotal * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant RealHalfCirclePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
