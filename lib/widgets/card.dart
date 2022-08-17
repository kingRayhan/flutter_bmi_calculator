import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Color color;
  final double spacing;
  final Widget? child;
  final Function()? onPress;

  const AppCard(
      {Key? key,
      this.color = const Color(0xFF1D1D2E),
      this.spacing = 15.0,
      this.child,
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(spacing),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: child,
      ),
    );
  }
}
