import 'package:flutter/material.dart';


class CustomFormTextField extends StatelessWidget {
  CustomFormTextField({

    this.hintText,
    this.onChanged,
    this.onSaved,
    this.obscureText = false,
     this.icon, this.textInputType,   TextEditingController? controller,
  });

  Function(String)? onChanged;
  Function(String)? onSaved;
  String? hintText;
  final IconData? icon;
  final TextInputType ?textInputType;
  bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child:Container(
        width: 352,
        height: 45,
        decoration: ShapeDecoration(
          color: Color(0xFF262626),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Color(0xFF2E3134),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x4D000000),
              blurRadius: 12,
              offset: Offset(4, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child:   TextFormField(
style: TextStyle(color: Colors.white),
          keyboardType: textInputType,
          onSaved: onSaved != null
              ? (value) {
            onSaved!(value!);
          }
              : null,
          obscureText: obscureText!,
          validator: (data) {
            if (data!.isEmpty) {
              return 'Field is required';
            }
          },


          onChanged: onChanged != null
              ? (value) {
            onChanged!(value!);
          }
              : null,
          decoration: InputDecoration(
            suffixIcon: Icon(icon,color: Colors.white,),
            filled: true,
            fillColor:   Color(0xFF262626),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.white,
              fontFamily: "Quicksand",

            ),
            focusedBorder: OutlineInputBorder(

                borderSide: BorderSide(color: Color(0xff696969))),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide( color: Color(0xFF262626),),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),

            ),
          ),
        ),
      )


    );
  }
}
// class CustomInputDecoration extends InputDecoration {
//
//   @override
//   Color get fillColor => Color(0xFF262626);
//
//   @override
//   OutlineInputBorder get border => OutlineInputBorder(
//     borderRadius: BorderRadius.circular(10),
//     borderSide: BorderSide(
//       width: 1,
//       color: Color(0xFF2E3134),
//     ),
//   );
//
//   @override
//   BoxShadow get shadow => BoxShadow(
//     color: Color(0x4D000000),
//     blurRadius: 12,
//     offset: Offset(4, 4),
//   );
//
// }