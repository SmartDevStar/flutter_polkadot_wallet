import 'package:flutter/material.dart';

class DcySecurityLevelLine extends StatelessWidget {
  const DcySecurityLevelLine({
    required this.level,
    super.key,
  });

  final int level;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: levelLines(level),
    );
  }

  List<Widget> levelLines(level) {
    return List<Widget>.generate(level, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 50,
        height: 2,
        decoration: BoxDecoration(
            color: level < 1
                ? Colors.red
                : level < 2
                    ? Colors.yellow
                    : Colors.green,
            shape: BoxShape.rectangle),
      );
    });
  }
}
