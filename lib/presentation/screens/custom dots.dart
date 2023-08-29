import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';



class CustomDots extends StatelessWidget {
  const CustomDots({
    Key? key,
    required this.dotIndex, this.activecolor,
  }) : super(key: key);

  final double? dotIndex;
  final Color ?activecolor;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 3,
      position: dotIndex?.round() ?? 0,
      decorator: DotsDecorator(
        activeColor: activecolor,
        activeSize: Size(25, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}