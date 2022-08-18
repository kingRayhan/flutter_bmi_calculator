import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final Function()? onPress;
  final IconData icon;
  final Color color;

  const CircularButton({
    Key? key,
    this.onPress,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 40,
        child: Icon(icon),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
