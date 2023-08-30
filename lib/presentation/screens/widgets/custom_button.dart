import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.size,
    required this.press,
    required this.text,

    this.image,

    required this.color, required this.height, required this.fontesiz,  required this.textColor,
  }) : super(key: key);

  final double size;
  final double height;

  final double fontesiz;
  final VoidCallback press;
  final String text;
  final String? image;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(

      height: height,
      width: size,
      decoration: BoxDecoration(
        color: color,

        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[


                Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: fontesiz,
                    fontFamily: "Brlaw",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}