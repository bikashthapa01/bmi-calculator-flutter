import 'package:flutter/cupertino.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String buttonTitle;
  final Function()? onButtonTap;
  const BottomButton({Key? key, required this.buttonTitle, this.onButtonTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: const TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
        color: kBottomContainerColor,
        height: kBottomContainerHeight,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10.0),
      ),
    );
  }
}
