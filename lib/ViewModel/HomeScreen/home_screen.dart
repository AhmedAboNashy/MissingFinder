import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'soon';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
          child: Lottie.asset('assets/images/soon.json', fit: BoxFit.fill)),
    );
  }
}