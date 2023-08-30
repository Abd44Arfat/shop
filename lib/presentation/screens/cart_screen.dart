import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/favourites_model.dart';
import 'package:untitled/presentation/screens/widgets/custom_product_card.dart';

import '../../cubits/products_cubit.dart';
import '../../models/products_model.dart';
import '../../shared/styles.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff1F1F1F),
        leading: Icon(Icons.arrow_back_ios),
        title: Center(child: Text('My Cart')),
      ),
      body: BlocProvider(
  create: (context) => ProductsCubit()..fetchFavData(),
  child: BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount:  ProductsCubit.get(context).favouritesModel?.data?.data.length ?? 0,
            itemBuilder: (context, index) {
              return CartProductCard(ProductsCubit.get(context).favouritesModel!.data.data[index]);
            },
          );
        },
      ),
),


    );
  }
  Widget CartProductCard(Datum model)=>


      Padding(
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

                  Image.network(model.product.image,height: 100,),


                  Spacer(),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(model.product.name,
                        style: getRegularStyle(color: Colors.white),),


                      Row(
                        children: [
                          Text(model.product.price.toString(), style: getRegularStyle(color: Colors
                              .white),


                          ),
                          Icon(Icons.star, color: Colors.yellow,)
                        ],
                      ),
                      Text(
                        model.product.oldPrice.toString(),
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


