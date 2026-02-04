import 'package:flutter/material.dart';

class AboutUi extends StatefulWidget {
  const AboutUi({super.key});

  @override
  State<AboutUi> createState() => _AboutUiState();
}

class _AboutUiState extends State<AboutUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('This is the About Screen.',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    )),
                SizedBox(height: 20),
                Image.asset('assets/images/calculator.png',
                    width: 200, height: 200, fit: BoxFit.cover),
                SizedBox(height: 20),
                Text(
                    'คำนวนหาดัชนีมวลกาย (BMI) และ อัตราการเผาผลาญพลังงานพื้นฐาน (BMR)'),
                SizedBox(height: 10),
                Text('คำนวนหาแคลอรี่ที่ร่างกายต้องการในแต่ละวัน (BMR)'),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.network(
                  'https://www.nlksau.ac.th/wp-content/uploads/2022/03/cropped-NLK-LOGO-1.png', //เปลี่ยนรูป
                  width: 100,
                  height: 100,
                ),
                Text(
                  'Created by NLK SAU',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
