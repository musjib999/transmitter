import 'package:flutter/material.dart';
import 'package:transmitter/module/screens/splash_screen.dart';

class TransmitterApp extends StatelessWidget {
  const TransmitterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Transmitter',
      home: SplashScreen(),
    );
  }
}
