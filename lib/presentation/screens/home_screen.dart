import 'package:flutter/material.dart';
import 'transfer_balance_screen.dart';
import 'settings_screen.dart';
import 'wallet_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List screens = const [
    WalletScreen(),
    TransferBalance(),
    SettingsScreen(),
  ];

  void onDestinationSelected(value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (value) => onDestinationSelected(value),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.wallet_outlined),
            label: 'Wallet',
            selectedIcon: Icon(Icons.wallet_rounded),
          ),
          NavigationDestination(
            icon: Icon(Icons.currency_bitcoin_outlined),
            label: 'Transfer',
            selectedIcon: Icon(Icons.currency_bitcoin_rounded),
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
            selectedIcon: Icon(Icons.settings_rounded),
          ),
        ],
      ),
      body: screens[_selectedIndex],
    );
  }
}
