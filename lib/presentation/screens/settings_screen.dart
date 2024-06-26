import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile settings',
          style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 30),
        ),
      ),
      body: ListView(
        children: const [
          SizedBox(
            height: 10,
          ),
          // Profile picture section
          CircleAvatar(
            radius: 50.0,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              child: Image(
                image: NetworkImage(
                    "https://assets.socialverseapp.com/profile/7.png"),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(),
          // Name section
          ListTile(
            title: Text('Wallet name'),
            subtitle: Text('My Bitcoin Wallet'),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
            title: Text('Nickname'),
            subtitle: Text('My Bitcoin Wallet'),
            trailing: Icon(Icons.edit),
          ),
          // Phone number section
          ListTile(
            title: Text('Phone Number'),
            subtitle: Text('+1 234-567-890'),
            trailing: Icon(Icons.edit),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(),
          SizedBox(
            height: 10,
          ),
          // Currency section
          ListTile(
            title: Text('Default Currency'),
            subtitle: Text('USD (United States Dollar)'),
            trailing: Icon(Icons.chevron_right),
          ),

          // Bitcoin Unit section
          ListTile(
            title: Text('Bitcoin Unit'),
            subtitle: Text('BTC'),
            trailing: Icon(Icons.chevron_right),
          ),

          // Security section
          ListTile(
            title: Text('Security'),
            trailing: Icon(Icons.chevron_right),
          ),

          // Notifications section
          ListTile(
            title: Text('Notifications'),
            trailing: Icon(Icons.chevron_right),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(),
          // Status section
          ListTile(
            title: Text('FAQ'),
            subtitle: Text('Frequently asked questions'),
            trailing: Icon(Icons.help),
          ),

          // About section
          ListTile(
            title: Text('About Pocket Wallet'),
            trailing: Icon(Icons.info),
          ),
        ],
      ),
    );
  }
}
