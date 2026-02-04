import 'package:flutter/material.dart';

class BmrUi extends StatefulWidget {
  const BmrUi({super.key});

  @override
  State<BmrUi> createState() => _BmrUiState();
}

class _BmrUiState extends State<BmrUi> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  String selectedGender = 'ชาย'; // ค่าเริ่มต้น
  double bmrValue = 0;
  String bmrMessage = '';

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
                  'คำนวณหาอัตราการเผาผลาญ (BMR)',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 30),
                Image.asset(
                  'assets/images/exercise.png',
                  width: 160,
                  height: 160,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'เพศ',
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        title: Text('ชาย'),
                        value: 'ชาย',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value!;
                          });
                        },
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        title: Text('หญิง'),
                        value: 'หญิง',
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value!;
                          });
                        },
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
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
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'อายุ (ปี)',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'กรอกอายุของคุณ',
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (weightController.text.isEmpty ||
                        heightController.text.isEmpty ||
                        ageController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('กรุณากรอกข้อมูลทั้งหมด'),
                          backgroundColor: Colors.transparent,
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }

                    double weight = double.parse(weightController.text);
                    double height = double.parse(heightController.text);
                    double age = double.parse(ageController.text);

                    setState(() {
                      if (selectedGender == 'ชาย') {
                        // สำหรับผู้ชาย : BMR = 66 + (13.7 x น้ำหนัก) + (5 x ส่วนสูง) – (6.8 x อายุ)
                        bmrValue =
                            66 + (13.7 * weight) + (5 * height) - (6.8 * age);
                      } else {
                        // สำหรับผู้หญิง : BMR = 665 + (9.6 x น้ำหนัก) + (1.8 x ส่วนสูง) – (4.7 x อายุ)
                        bmrValue =
                            665 + (9.6 * weight) + (1.8 * height) - (4.7 * age);
                      }

                      // สร้างข้อความแปลความหมาย
                      if (bmrValue < 1200) {
                        bmrMessage = 'ต่ำ - อัตราการเผาผลาญช้า';
                      } else if (bmrValue < 1600) {
                        bmrMessage = 'ปกติ - อัตราการเผาผลาญปกติ';
                      } else {
                        bmrMessage = 'สูง - อัตราการเผาผลาญสูง';
                      }
                    });
                  },
                  child: Text(
                    'คำนวณ BMR',
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
                      ageController.clear();
                      selectedGender = 'ชาย';
                      bmrValue = 0;
                      bmrMessage = '';
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
                if (bmrValue > 0)
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
                            'ผลลัพธ์',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            '${bmrValue.toStringAsFixed(2)} kcal/วัน',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            bmrMessage,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
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

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    ageController.dispose();
    super.dispose();
  }
}
