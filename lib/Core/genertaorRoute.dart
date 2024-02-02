import 'package:flutter/material.dart';
import 'package:missing_finder/View/Welcome/interFce.dart';

import '../View/Welcome/completeShow.dart';
import '../ViewModel/Register/createAccount.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    dynamic arg = settings.arguments;
    switch (settings.name) {
      case InterFace.routeName:
        return MaterialPageRoute(
          builder: (context) => InterFace(),
        );
      case CreateAccount.routeName:
        return MaterialPageRoute(
          builder: (context) => CreateAccount(),
        );
      case CompleteShow.routeName:
        return MaterialPageRoute(
          builder: (context) => CompleteShow(),
        );

      default:
        return _error();
    }
  }

  static Route<dynamic> _error() {
    return MaterialPageRoute(
      builder: (context) {
        return const Scaffold(
          body: Center(
            child: Text("Error"),
          ),
        );
      },
    );
  }
}