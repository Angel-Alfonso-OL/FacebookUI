import 'package:flutter/material.dart';

class MyAspectRatio extends StatelessWidget {
  const MyAspectRatio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: Image.network(
            "https://e1.pngegg.com/pngimages/670/695/png-clipart-goku-ssj-blue-v3-son-guko-character.png",
          fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
