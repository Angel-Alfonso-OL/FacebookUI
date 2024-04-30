import 'package:facebook_ui/facebook_ui/facebook_ui.dart';
import 'package:facebook_ui/facebook_ui/widgets/aspect_ratio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        
        fontFamily: "Nunito",
      ),
      debugShowCheckedModeBanner: false,
      home: FacebookUI(),
    );
  }
}
