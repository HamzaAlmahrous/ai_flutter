import 'package:flutter/material.dart';

import '../../../../core/util/themes.dart';

/// Row for one Stats field
class StatsRow extends StatelessWidget {
  final String left;
  final String right;

  const StatsRow(this.left, this.right, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(left, style: TextStyle(color: aiWhite),), Text(right, style: TextStyle(color: aiWhite))],
      ),
    );
  }
}
