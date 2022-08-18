import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  final String label;
  final Function() onPress;

  const LongButton({
    Key? key,
    required this.label,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: onPress,
        child: Ink(
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(10)),
          height: 80.0,
          child: Center(
            child: Text(
              label.toUpperCase(),
              style: TextStyle(fontSize: 22),
            ),
          ),
        ),
      ),
    );
  }
}
