import 'package:bmi/bmi_calculator.dart';
import 'package:bmi/constants.dart';
import 'package:bmi/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/card.dart';
import '../widgets/curcular_button.dart';
import '../widgets/icon_content.dart';
import '../widgets/long_button.dart';
import '../widgets/number_controller_input.dart';

const inactiveCardColor = Color(0xff1111328);
const activeCardColor = Color(0xFF1D1E33);

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);
  @override
  _InputScreenState createState() => _InputScreenState();
}

enum GENDER { MALE, FEMALE }

class _InputScreenState extends State<InputScreen> {
  GENDER? _selectedGender = null;
  int height = 180;
  int weight = 75;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: AppCard(
                    onPress: (() {
                      setState(() => _selectedGender = GENDER.MALE);
                    }),
                    color: _selectedGender == GENDER.MALE
                        ? inactiveCardColor
                        : activeCardColor,
                    child: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: AppCard(
                    onPress: (() {
                      setState(() => _selectedGender = GENDER.FEMALE);
                    }),
                    color: _selectedGender == GENDER.FEMALE
                        ? inactiveCardColor
                        : activeCardColor,
                    child: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: "FEMALE",
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: AppCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "height".toUpperCase(),
                    style: kLabelTextStyle,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Colors.red,
                      overlayColor: Color.fromARGB(35, 244, 67, 54),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double value) {
                        setState(() => height = value.toInt());
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: AppCard(
                    child: NumberControllerInput(
                      value: weight,
                      label: "weight",
                      onPressMinus: () => setState(() => weight--),
                      onPressPlus: () => setState(() => weight++),
                    ),
                  ),
                ),
                Expanded(
                  child: AppCard(
                    child: NumberControllerInput(
                      value: age,
                      label: "age",
                      onPressMinus: () => setState(() => age--),
                      onPressPlus: () => setState(() => age++),
                    ),
                  ),
                )
              ],
            ),
          ),
          LongButton(
            label: 'Calculate',
            onPress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultScreen(
                            bmiCalculator:
                                BMICalculator(height: height, weight: weight),
                          )));
            },
          )
        ],
      ),
    );
  }
}
