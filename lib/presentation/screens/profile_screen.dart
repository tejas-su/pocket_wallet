// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_wallet/presentation/widgets/cta_button.dart';
import 'package:my_wallet/presentation/widgets/info_chips.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 50,
                    foregroundImage: AssetImage('assets/profile/man.png'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '@tejas.s.u_',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          InfoChips(title: '0', subtitle: 'following'),
                          InfoChips(title: '0', subtitle: 'followers'),
                          InfoChips(title: '0', subtitle: 'posts'),
                        ],
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: CtaButton(
                  text: 'Edit profile',
                  height: 55,
                  fontSize: 18,
                  radius: 15,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              const TabBar(
                  splashFactory: NoSplash.splashFactory,
                  dividerColor: Colors.transparent,
                  tabs: [
                    Text(
                      'Posts',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'Liked',
                      style: TextStyle(fontSize: 18),
                    )
                  ])
            ],
          ),
        ),
      ),
    );
  }
}
