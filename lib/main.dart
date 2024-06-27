import 'package:flutter/material.dart';
import 'package:my_wallet/model/user_model.dart';
import 'package:my_wallet/presentation/auth/auth.dart';
import 'package:my_wallet/presentation/screens/create_wallet_screen.dart';
import 'presentation/theme/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //initialize hive for storing user details and tokens for later access
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox('users');

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darktheme,
      home: const Auth(),
    );
  }
}
