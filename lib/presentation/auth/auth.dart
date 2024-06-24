import 'package:flutter/material.dart';
import '../screens/signin_screen.dart';
import '../screens/signup_screen.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  var selectedIndex = true;
  void switchScreen() {
    setState(() {
      selectedIndex = !selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (selectedIndex) {
      return SigninScreen(
        onTap: switchScreen,
      );
    } else {
      return SignupScreen(
        onTap: switchScreen,
      );
    }
  }
}
