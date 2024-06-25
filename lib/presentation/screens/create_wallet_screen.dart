import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_wallet/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';

import '../../model/user_model.dart';
import '../../services/services.dart';
import '../widgets/cta_button.dart';

class CreateWalletScreen extends StatelessWidget {
  const CreateWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController networkController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    Wallet walletService = Wallet();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Image(
              image: AssetImage('assets/logo/create.png'),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              'pocket',
              style:
                  GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 40),
            )),
            const Center(
              child: Text('your personal wallet'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                    hintText: 'Your name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: TextField(
                controller: networkController,
                enabled: false,
                obscureText: false,
                decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.currency_bitcoin_rounded),
                    hintText: 'Bitcoin',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.lock_rounded),
                    hintText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
              child: Consumer(
                builder: (context, value, child) {
                  return CtaButton(
                    text: 'Create Wallet',
                    onTap: () async {
                      final username = usernameController.text;
                      final password = passwordController.text;

                      //Handle if fields are empty
                      if (username.isEmpty || password.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              backgroundColor:
                                  Color.fromARGB(255, 248, 101, 101),
                              content: Text(
                                'Please fill in your credentials!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                        );
                      } else {
                        //Show authenticating process
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              backgroundColor:
                                  const Color.fromRGBO(56, 56, 56, 1),
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Creating $username\'s wallet',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(width: 8),
                                  const SizedBox(
                                      height: 8,
                                      width: 8,
                                      child: CircularProgressIndicator())
                                ],
                              )),
                        );
                        var box = await Hive.openBox('wallet');
                        var boxUser = await Hive.openBox('users');
                        User data = boxUser.get('users');
                        // Call login method from LoginService
                        final walletData = await walletService.createWallet(
                            username, password, data.token.toString());
                        await box.put('wallet', walletData);
                        print('Wallet Data: ${walletData}, ${data.token}');
                        if (walletData?.status == 'success') {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        }

                        //Show error status if passwords does not match
                        else if (walletData?.status == 'error') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                backgroundColor:
                                    const Color.fromRGBO(56, 56, 56, 1),
                                content: Text(
                                  '${walletData?.message}',
                                  style: const TextStyle(color: Colors.white),
                                )),
                          );
                        }
                      }
                    },
                    fontWeight: FontWeight.bold,
                    radius: 10,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
