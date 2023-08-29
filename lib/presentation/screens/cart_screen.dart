import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:untitled/presentation/screens/widgets/custom_product_card.dart';

import '../../models/products_model.dart';
import '../../shared/styles.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff1F1F1F),
        leading: Icon(Icons.arrow_back_ios),
        title: Center(child: Text('My Cart')),
      ),
        body: ListView(
            children: [




            ]
        )
    );

        // Container(
        //   width: double.infinity,
        //   height: 118,
        //   decoration: BoxDecoration(
        //
        //       color: Color(0xff262626)
        //
        //   ),
        //   child: Padding(
        //     padding: const EdgeInsets.all(20),
        //     child: Row(children: [
        //       Text('Total', style: getMediumStyle(color: Colors.white),)
        //
        //     ],),
        //   ),
        //
        // )

        //]


  }
}


class CartProductCard extends StatelessWidget {

  const CartProductCard({super.key, });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(

        width: double.infinity,

        height: 199,

        decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10),

            color: Color(0xff262626)),

        child: Padding(

          padding: const EdgeInsets.all(8.0),

          child: Column(

            children: [

              Row(children: [

                Image.asset('assets/images/item.png', height: 100,),


                Spacer(),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text('CosmicByte GS430Wireless Headset ',
                      style: getRegularStyle(color: Colors.white),),


                    Row(
                      children: [
                        Text('4.5 ', style: getRegularStyle(color: Colors.white),


                        ),
                        Icon(Icons.star, color: Colors.yellow,)
                      ],
                    ),
                    Text(
                      "159.00",
                      style: getRegularStyle(color: Colors.white),
                    )

                  ],)

              ],),

            ],

          ),

        ),

      ),
    );

  }
}
