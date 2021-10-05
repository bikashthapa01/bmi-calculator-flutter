import 'package:flutter/cupertino.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget? cardChild;
  final Function()? onClick;
  const ReusableCard(
      {required this.color, Key? key, this.cardChild, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}
