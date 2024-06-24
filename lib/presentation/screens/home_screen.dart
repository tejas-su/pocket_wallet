import 'package:flutter/material.dart';
import 'profile_screen.dart';
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
    ProfileScreen(),
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
            icon: Icon(Icons.person_outline),
            label: 'Profile',
            selectedIcon: Icon(Icons.person_rounded),
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
