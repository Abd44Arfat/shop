import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/products_cubit.dart';
import '../../../models/products_model.dart';
import 'custom_product_card.dart';
class HorizontalProductList extends StatefulWidget {
  @override
  State<HorizontalProductList> createState() => _HorizontalProductListState();
}

class _HorizontalProductListState extends State<HorizontalProductList> {
  List<Product>? products;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit()..fetchHomeData(),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return CircularProgressIndicator();
          } else if (state is ProductsSuccess) {
            return Container(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: context.watch<ProductsCubit>().homeModel?.data.products?.length ,
                itemBuilder: (context, index) {
                  Product product = context.watch<ProductsCubit>().homeModel!.data.products[index];
                  return CustomProductCard(
                      product: product,

                  );
                },
              ),
            );
          } else if (state is ProductsFailure) {
            return Text('Failed to fetch data');
          } else {
            return Text('Initial state');
          }
        },
      ),
    );
  }
}