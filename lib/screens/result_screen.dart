import 'package:bmi/bmi_calculator.dart';
import 'package:bmi/constants.dart';
import 'package:bmi/widgets/card.dart';
import 'package:flutter/material.dart';

import '../widgets/long_button.dart';

class ResultScreen extends StatelessWidget {
  final BMICalculator bmiCalculator;

  const ResultScreen({
    super.key,
    required this.bmiCalculator,
  });

  @override
  Widget build(BuildContext context) {
    String result = bmiCalculator.calculateBMI();

    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              "Your Result".toUpperCase(),
              style: kNumberTextStyle,
            ),
          ),
          Expanded(
            child: AppCard(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 65),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    bmiCalculator.getResult(),
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    result,
                    style:
                        TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      bmiCalculator.getInterpretation(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  )
                ],
              ),
            )),
          ),
          LongButton(
              label: "Re Calculate",
              onPress: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
