import 'package:flutter/material.dart';
import 'package:my_wallet/services/services.dart';
import '../../model/user_model.dart';
import '../screens/home_screen.dart';
import '../screens/signin_screen.dart';
import '../screens/signup_screen.dart';

class Auth extends StatefulWidget {
  //final User? data;
  const Auth({
    super.key,
    //required this.data
  });

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
    GetUSerDataFromBox boxData = GetUSerDataFromBox();
    User? data = boxData.getUserDataFromBox();
    if (data?.status == 'success' &&
        (data?.has_wallet == true || data?.has_wallet != null)) {
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
