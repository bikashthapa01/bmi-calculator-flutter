import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class IconContent extends StatelessWidget {
  final String label;
  final IconData cardIcon;

  const IconContent({
    required this.label,
    required this.cardIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: 80.0,
          color: Colors.white70,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          label, //TODO: mutable text
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
