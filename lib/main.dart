import 'package:flutter/material.dart';
import 'package:my_wallet/model/user_model.dart';
import 'package:my_wallet/presentation/auth/auth.dart';
import 'presentation/theme/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //initialize hive for storing user details and tokens for later access
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  var box = await Hive.openBox('users');
  User data = box.get('users');
  print('Data in local storage after main function \n\n${data}\n\n');
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(
    user: data,
  ));
}

class MyApp extends StatelessWidget {
  final User user;
  const MyApp({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darktheme,
      home: Auth(
        data: user,
      ),
    );
  }
}
