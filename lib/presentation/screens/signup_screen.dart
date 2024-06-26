import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/cta_button.dart';
import '../widgets/input_field.dart';

class SignupScreen extends StatelessWidget {
  final Function()? onTap;
  const SignupScreen({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    TextEditingController? usernameController = TextEditingController();
    TextEditingController? passwordController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Image(
              image: AssetImage('assets/logo/signup.png'),
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
            //Username, Email or Phone number
            InputTextField(
              controller: usernameController,
              hintText: 'Username, Email or Phone number',
            ),
            //Password
            InputTextField(
              controller: passwordController,
              hintText: 'Password',
              obobscureText: true,
              icon: Icons.lock_rounded,
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: CtaButton(
                text: 'Signup',
                fontWeight: FontWeight.bold,
                radius: 10,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: Divider(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account? '),
                GestureDetector(
                  onTap: onTap,
                  child: const Text(
                    'Signin',
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
