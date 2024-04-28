
import 'package:facebook_ui/facebook_ui/widgets/avatar.dart';
import 'package:flutter/material.dart';

class WhatIsOnYourMind extends StatelessWidget {
  const WhatIsOnYourMind({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Avatar(
          size: 50,
          asset: "assets/users/1.jpg",
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          "What's on yoru mind?",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
