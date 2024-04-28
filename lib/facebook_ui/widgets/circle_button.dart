
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final Color color;
  final IconData icon;

  const CircleButton({
    super.key,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 18,
      ),
    );
  }
}
