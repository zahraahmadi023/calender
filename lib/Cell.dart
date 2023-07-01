import 'package:flutter/material.dart';

class buildCell extends StatelessWidget {
  const buildCell({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Text(text),
    );
  }
}
