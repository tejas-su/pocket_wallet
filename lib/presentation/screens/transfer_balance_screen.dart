import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_wallet/model/transaction_model.dart';
import 'package:my_wallet/model/user_model.dart';
import 'package:my_wallet/presentation/widgets/cta_button.dart';
import 'package:my_wallet/presentation/widgets/wallet_card.dart';
import 'package:my_wallet/services/services.dart';

import '../widgets/input_field.dart';

class TransferBalance extends StatelessWidget {
  const TransferBalance({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    TextEditingController recipientAddressController = TextEditingController();
    TextEditingController senderAddressController = TextEditingController();
    TextEditingController amountControllerTB = TextEditingController();
    TextEditingController amountControllerAD = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController walletAddressController = TextEditingController();
    Wallet walletService = Wallet();
    GetUSerDataFromBox userDataFromBox = GetUSerDataFromBox();
    User data = userDataFromBox.getUserDataFromBox();
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
            WalletCard(
              balance: data.balance!.toInt(),
            ),

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
              controller: recipientAddressController,
              hintText: 'Recipient Address',
              icon: Icons.person_rounded,
            ),
            //network
            const InputTextField(
              top: 20,
              // controller: networkController,
              enabled: false,
              hintText: 'devnet',
            ),
            //Sender address
            InputTextField(
              top: 20,
              controller: senderAddressController,
              hintText: 'Sender\'s Address',
            ),
            //amount
            InputTextField(
              top: 20,
              controller: amountControllerTB,
              hintText: 'Amount ',
              keyboardType: TextInputType.number,
            ),
            //User pin
            InputTextField(
              top: 20,
              controller: passwordController,
              hintText: 'Password ',
              icon: Icons.lock_rounded,
              obobscureText: true,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10, top: 20),
                  child: CtaButton(
                    text: 'Cancel',
                    onTap: null,
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
                    onTap: () async {
                      String recipientAddress = recipientAddressController.text;
                      String sendersAddress = senderAddressController.text;
                      String amount = amountControllerTB.text;
                      String password = passwordController.text;

                      User datafrombox = userDataFromBox.getUserDataFromBox();
                      String token = datafrombox.token.toString();
                      //check if user has entered all the fields
                      if (recipientAddress.isEmpty ||
                          sendersAddress.isEmpty ||
                          amount.isEmpty ||
                          password.isEmpty) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                backgroundColor: Color.fromRGBO(56, 56, 56, 1),
                                content: Text(
                                  'Please fill in all the fields!',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                )));
                      } else {
                        //Show transfering balance
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              duration: Durations.extralong1,
                              backgroundColor: Color.fromRGBO(56, 56, 56, 1),
                              content: Text(
                                'Tranfering funds to recipient address',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              )),
                        );
                        TransactionModel? response =
                            await walletService.transferBalance(
                                recipientAddress,
                                sendersAddress,
                                amount,
                                password,
                                token);
                        if (response?.status == 'success') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                backgroundColor:
                                    const Color.fromRGBO(56, 56, 56, 1),
                                content: Text(
                                  '${response?.message}',
                                  style: const TextStyle(color: Colors.white),
                                )),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Color.fromRGBO(56, 56, 56, 1),
                                content: Text(
                                  'Transaction failed, please try again later',
                                  style: TextStyle(color: Colors.white),
                                )),
                          );
                        }
                      }
                    },
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    radius: 10,
                    width: width / 2.3,
                  ),
                ),
              ],
            ),
            //##################################################################################################
            //############################################################Request Airdrop
            //################################################################################################
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Request airdrop',
                textAlign: TextAlign.start,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, fontSize: 20),
              ),
            ),
            InputTextField(
              top: 0,
              controller: recipientAddressController,
              hintText: 'Wallet address',
              icon: Icons.person_rounded,
            ),
            InputTextField(
              top: 20,
              enabled: false,
              controller: recipientAddressController,
              hintText: 'devnet',
              icon: Icons.person_rounded,
            ),
            const SizedBox(height: 20),
            InputTextField(
              top: 0,
              controller: recipientAddressController,
              keyboardType: TextInputType.number,
              labelText: 'You pay',
              hintText: 'Amount',
              icon: Icons.person_rounded,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10, top: 20),
                  child: CtaButton(
                    text: 'Cancel',
                    onTap: null,
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
                    onTap: () async {
                      String wallet_address = walletAddressController.text;
                      int? amount = int.tryParse(amountControllerAD.text);
                      User datafrombox = userDataFromBox.getUserDataFromBox();
                      String token = datafrombox.token.toString();

                      if (wallet_address.isEmpty || amount == null) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                backgroundColor: Color.fromRGBO(56, 56, 56, 1),
                                content: Text(
                                  'Please fill in all the fields!',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                                )));
                      } else {
                        //Show transfering balance
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              duration: Durations.extralong1,
                              backgroundColor: Color.fromRGBO(56, 56, 56, 1),
                              content: Text(
                                'Processing air drop request',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              )),
                        );
                        TransactionModel? response = await walletService
                            .airDrop(wallet_address, 'devnet', token, amount);

                        if (response?.status == 'success') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                backgroundColor:
                                    const Color.fromRGBO(56, 56, 56, 1),
                                content: Text(
                                  '${response?.message}',
                                  style: const TextStyle(color: Colors.white),
                                )),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Color.fromRGBO(56, 56, 56, 1),
                                content: Text(
                                  'Transaction failed, please try again later',
                                  style: TextStyle(color: Colors.white),
                                )),
                          );
                        }
                      }
                    },
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    radius: 10,
                    width: width / 2.3,
                  ),
                ),
              ],
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
