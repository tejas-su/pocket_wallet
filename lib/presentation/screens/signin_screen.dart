// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_wallet/presentation/screens/home_screen.dart';
import 'package:my_wallet/presentation/widgets/cta_button.dart';
import 'package:my_wallet/services/services.dart';
import 'package:provider/provider.dart';

class SigninScreen extends StatelessWidget {
  final Function()? onTap;
  const SigninScreen({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    TextEditingController? usernameController = TextEditingController();
    TextEditingController? passwordController = TextEditingController();
    LoginSignupService loginSignupService = LoginSignupService();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Image(
              image: AssetImage('assets/logo/signin.png'),
            ),
            const SizedBox(
              height: 20,
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
                    hintText: 'Username, Email or Phone number',
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
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: Consumer(
                builder: (context, value, child) {
                  return CtaButton(
                    text: 'Login',
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
                                    'Authenticating user $username',
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

                        // Call login method from LoginService
                        final loginData =
                            await loginSignupService.login(username, password);

                        if (loginData?.status == 'success') {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        }
                        //Show error status if passwords does not match
                        else if (loginData?.status == 'error') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                backgroundColor:
                                    const Color.fromRGBO(56, 56, 56, 1),
                                content: Text(
                                  '${loginData?.message}',
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
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: Divider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account? '),
                GestureDetector(
                  onTap: onTap,
                  child: const Text(
                    'Signup',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
