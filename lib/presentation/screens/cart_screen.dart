
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:untitled/models/favourites_model.dart';


import '../../cubits/products_cubit.dart';

import '../../shared/app_router.dart';
import '../../shared/styles.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff1F1F1F),
        leading: GestureDetector(
            onTap: (){   GoRouter.of(context).go(AppRouter.KApprouter);},
            child: Icon(Icons.arrow_back_ios)),
        title: Center(child: Text('My Cart')),
      ),
      body: BlocProvider(
  create: (context) => ProductsCubit()..fetchFavData(),
  child: BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) {
        if (state is CartAddedSuccess)
          BlocProvider.of<ProductsCubit>(context).fetchFavData();


        },
        builder: (context, state) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount:  ProductsCubit.get(context).favouritesModel?.data?.data.length ?? 0,
            itemBuilder: (context, index) {
              return CartProductCard(ProductsCubit.get(context).favouritesModel!.data.data[index],context);
            },
          );
        },
      ),
),


    );
  }
  Widget CartProductCard(Datum model,context)=>


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

                Row(
                  children: [
                    Image.network(
                      model.product.image,
                      height: 100,
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.product.name,
                            style: getRegularStyle(color: Colors.white),
                          ),
                          Row(
                            children: [
                              Text(
                                model.product.oldPrice.toString(),
                                style: getRegularStyle(color: Colors.grey,decoration: TextDecoration.lineThrough),
                              ),

                            ],
                          ),
                          Text(
                            model.product.price.toString(),
                            style: getRegularStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],

            ),

          ),

        ),
      );
}


