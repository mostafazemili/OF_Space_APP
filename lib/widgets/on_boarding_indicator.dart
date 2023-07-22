
import 'package:flutter/material.dart';

class OnBoardingIndicator extends StatelessWidget {
  const OnBoardingIndicator({
    Key? key,
    required bool isSlected,
    double marginEnd =  0
  }) : _isSlected = isSlected, _marginEnd = marginEnd , super(key: key);

  final bool _isSlected;
  final double _marginEnd ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4 ,
      width: 18,
      margin: EdgeInsetsDirectional.only(end: _marginEnd),
      decoration: BoxDecoration(
        color:   _isSlected  ? Colors.blue : const Color(0xFFDDDDDD),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}