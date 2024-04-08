

import 'package:demoapp/src/utils/const.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final int hi;

  const ItemCard({super.key, required this.hi});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Hello $hi"),
      ),
    );
  }
}