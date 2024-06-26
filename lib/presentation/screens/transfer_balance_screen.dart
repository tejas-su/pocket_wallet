// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_wallet/presentation/widgets/cta_button.dart';
import 'package:my_wallet/presentation/widgets/info_chips.dart';
import 'package:my_wallet/presentation/widgets/wallet_card.dart';

import '../widgets/input_field.dart';

class TransferBalance extends StatelessWidget {
  const TransferBalance({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    TextEditingController userController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Pocket',
        style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 30),
      )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WalletCard(),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Transfer balance',
                textAlign: TextAlign.start,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, fontSize: 20),
              ),
            ),
            //Recipient Username
            InputTextField(
              top: 0,
              controller: userController,
              hintText: 'Recipient Username',
              icon: Icons.person_rounded,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10, top: 20),
                  child: CtaButton(
                    text: 'Cancel',
                    fontWeight: FontWeight.bold,
                    borderColor: Theme.of(context).dividerColor,
                    color: Colors.transparent,
                    width: width / 2.3,
                    radius: 10,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0, right: 20, top: 20),
                  child: CtaButton(
                    text: 'Send',
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    radius: 10,
                    width: width / 2.3,
                  ),
                ),
              ],
            ),
            //Swap Currency
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Swap balance',
                textAlign: TextAlign.start,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, fontSize: 20),
              ),
            ),
            InputTextField(
              top: 0,
              controller: userController,
              hintText: 'Enter Amount',
              labelText: 'You pay',
              icon: Icons.person_rounded,
            ),
            SizedBox(height: 20),
            InputTextField(
              top: 0,
              enabled: false,
              controller: userController,
              hintText: 'You recieve',
              icon: Icons.person_rounded,
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
