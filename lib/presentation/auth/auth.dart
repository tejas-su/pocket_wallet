import 'package:flutter/material.dart';
import '../../model/user_model.dart';
import '../screens/home_screen.dart';
import '../screens/signin_screen.dart';
import '../screens/signup_screen.dart';

class Auth extends StatefulWidget {
  final User data;
  const Auth({super.key, required this.data});

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
    if (widget.data.status == 'success' &&
        (widget.data.hasWallet == true || widget.data.hasWallet != null)) {
      return const HomeScreen();
    }

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
