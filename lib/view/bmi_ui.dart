import 'package:flutter/material.dart';

class BmiUi extends StatefulWidget {
  const BmiUi({super.key});

  @override
  State<BmiUi> createState() => _BmiUiState();
}

class _BmiUiState extends State<BmiUi> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  double bmiValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 10),
                Text(
                  'คำนวณหาค่าดัชนีมวลกาย (BMI)',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 30),
                Image.asset(
                  'assets/images/bmi.png',
                  width: 160,
                  height: 160,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'น้ำหนัก (kg.)',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรอกน้ำหนักของคุณ',
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ส่วนสูง (cm.)',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรอกส่วนสูงของคุณ',
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (weightController.text.isEmpty &&
                        heightController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('กรุณากรอกน้ำหนักและส่วนสูง'),
                          backgroundColor: Colors.transparent,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                    double weight = double.parse(weightController.text);
                    double height = double.parse(heightController.text) / 100;
                    setState(() {
                      bmiValue = weight / (height * height);
                    });
                  },
                  child: Text(
                    'คำนวณ BMI',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    textStyle: TextStyle(fontSize: 18),
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      55.0,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      heightController.clear();
                      weightController.clear();
                      bmiValue = 0;
                    });
                  },
                  child: Text(
                    'ล้างข้อมูล',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[400],
                    textStyle: TextStyle(fontSize: 18),
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      55.0,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'BMI',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        Text(
                          bmiValue.toStringAsFixed(2),
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.red[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
