import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_wallet/presentation/widgets/cta_button.dart';
import '../widgets/activity_tab.dart';
import '../widgets/token_tab.dart';
import '../widgets/wallet_card.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    ScrollController scrollController = ScrollController();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Pocket',
          style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 30),
        ),
        actions: const [
          TextButton(
            onPressed: null,
            child: Row(
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
          ),
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: NestedScrollView(
        controller: scrollController,
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  //wallet card
                  const Column(
                    children: [
                      WalletCard(),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  TabBar(
                    controller: tabController,
                    splashFactory: NoSplash.splashFactory,
                    dividerColor: Colors.transparent,
                    tabs: const [
                      Text(
                        'Tokens',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Activity',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: tabController,
          children: const [
            TokenTab(),
            ActivityTab(),
          ],
        ),
      ),
    );
  }
}
