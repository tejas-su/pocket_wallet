import 'package:flutter/material.dart';

class ActivityTab extends StatelessWidget {
  const ActivityTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 3,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return const ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            foregroundImage: AssetImage('assets/logo/etherium.png'),
          ),
          title: Text(
            'Mainnet',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          subtitle: Text('MATIC'),
          trailing: Text(
            '0 MATIC\n0.00 USD',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
        );
      },
    );
  }
}
