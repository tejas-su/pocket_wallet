import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({super.key});

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
                '\$ 200.00',
                maxLines: 1,
                style: GoogleFonts.inter(
                    fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),

              //Network goes below
              GestureDetector(
                child: const Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.amber,
                      radius: 7,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Polygon Mainnet',
                      style: TextStyle(color: Colors.white54),
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
