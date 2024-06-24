import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_wallet/presentation/screens/home_screen.dart';
import 'package:my_wallet/presentation/widgets/cta_button.dart';

class SigninScreen extends StatefulWidget {
  final Function()? onTap;
  const SigninScreen({super.key, required this.onTap});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
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
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Username, Email or Phone number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.lock_rounded),
                    hintText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
              child: CtaButton(
                text: 'Login',
                onTap: () =>
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                )),
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
                const Text('Don\'t have an account? '),
                GestureDetector(
                  onTap: widget.onTap,
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
