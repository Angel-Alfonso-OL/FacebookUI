import 'package:facebook_ui/facebook_ui/widgets/circle_button.dart';
import 'package:flutter/material.dart';

class QuickButton extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final String label;

  const QuickButton({
    super.key,
    required this.iconData,
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: 25,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          CircleButton(
            color: color.withOpacity(0.6),
            icon: iconData,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            label,
            style: TextStyle(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
