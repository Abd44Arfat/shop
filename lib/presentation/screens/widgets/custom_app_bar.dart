import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row (

      children: [
        Icon( FeatherIcons.alignLeft) ,
        Spacer(),
        Icon( FeatherIcons.bell) ,

      ],
    );
  }
}
