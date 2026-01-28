import 'package:flutter/material.dart';
import 'package:flutter_body_health_calculator_app/view/about_ui.dart';
import 'package:flutter_body_health_calculator_app/view/bmi_ui.dart';
import 'package:flutter_body_health_calculator_app/view/bmr_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

int currentIndexStatus = 1;
List<Widget> showbody = [
  BmiUi(),
  AboutUi(),
  BmrUi(),
];

class _HomeUiState extends State<HomeUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text(
          'Body Health Calculator',
          style: TextStyle(
            color: Color(0xFFFCFCFC),
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              currentIndexStatus = value;
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => showbody[value],
              ),
            );
          },
          currentIndex: currentIndexStatus,
          selectedItemColor: Color(0xFF0A0E21),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_outlined,
              ),
              label: 'BMI',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'About',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.personBooth),
              label: 'BMR',
            ),
          ]),
      body: Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}
