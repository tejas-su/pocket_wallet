import 'package:flutter/material.dart';

class TokenTab extends StatelessWidget {
  const TokenTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 7,
      itemBuilder: (context, index) {
        return const ListTile(
          leading: Icon(
            Icons.currency_bitcoin_rounded,
            size: 30,
          ),
          title: Text(
            'Polygon',
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
