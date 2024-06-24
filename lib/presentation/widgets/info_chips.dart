import 'package:flutter/material.dart';

class InfoChips extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function()? onTap;
  const InfoChips(
      {super.key, required this.title, required this.subtitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(title), Text(subtitle)],
        ),
      ),
    );
  }
}
