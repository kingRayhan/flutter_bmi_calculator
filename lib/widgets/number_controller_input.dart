import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import 'curcular_button.dart';

class NumberControllerInput extends StatelessWidget {
  final String label;
  final int value;
  final Function() onPressPlus;
  final Function() onPressMinus;

  const NumberControllerInput({
    Key? key,
    required this.label,
    required this.onPressPlus,
    required this.onPressMinus,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label.toUpperCase(),
          style: kLabelTextStyle,
        ),
        Text(
          value.toString(),
          style: kNumberTextStyle,
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularButton(
              onPress: onPressMinus,
              icon: FontAwesomeIcons.minus,
              color: kPrimaryColor,
            ),
            SizedBox(width: 12),
            CircularButton(
              onPress: onPressPlus,
              icon: FontAwesomeIcons.plus,
              color: kPrimaryColor,
            ),
          ],
        )
      ],
    );
  }
}
