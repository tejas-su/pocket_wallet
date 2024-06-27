import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletCard extends StatelessWidget {
  final int balance;
  final String network;
  const WalletCard(
      {super.key, this.balance = 0, this.network = 'Polygon Mainnet'});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Balance',
                style: GoogleFonts.inter(fontSize: 15),
              ),
              const SizedBox(
                height: 20,
              ),
              //Wallet BAlance goes here
              Text(
                '\$ $balance.00',
                maxLines: 1,
                style: GoogleFonts.inter(
                    fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),

              //Network goes below
              GestureDetector(
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 7,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      network,
                      style: const TextStyle(color: Colors.white54),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
