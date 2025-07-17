import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // ✅ Import Firestore
import 'cards.dart';
import 'home_screen.dart';

class Results extends StatelessWidget {
  Results({
    required this.interpretation,
    required this.bmiResult,
    required this.resultText,
  });

  final String bmiResult;
  final String resultText;
  final String interpretation;

  // ✅ Firestore method to upload BMI results
  Future<void> sendResultsToFirestore() async {
    try {
      await FirebaseFirestore.instance.collection('bmi_results').add({
        'bmi': bmiResult,
        'resultText': resultText,
        'interpretation': interpretation,
        'timestamp': FieldValue.serverTimestamp(),
      });
      print('✅ BMI Result sent to Firestore.');
    } catch (e) {
      print('❌ Error sending result to Firestore: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // ✅ Call the function when screen is built
    sendResultsToFirestore();

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Stack(
        children: [
          // ✅ Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // ✅ Main content
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Your Results',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Conbg(
                  colour: Color(0xff1D1E33).withOpacity(0.85), // slight transparency
                  childCard: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        resultText.toUpperCase(),
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        bmiResult,
                        style: TextStyle(
                          fontSize: 100.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        interpretation,
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  child: Center(
                    child: Text(
                      'RE-CALCULATE',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  height: 55.0,
                  margin: EdgeInsets.only(top: 15.0),
                  padding: EdgeInsets.only(bottom: 20.0),
                  width: double.infinity,
                  color: CalcBtColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
