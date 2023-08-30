import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/cubits/products_cubit.dart';

import '../../../models/products_model.dart';
import '../../../shared/styles.dart';

class CustomProductCard extends StatelessWidget {
  final Product product;

  const CustomProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color(0xff1F1F1F),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            product.name,
            style: getRegularStyle(color: Colors.white),
          ),
          Text(
            product.price.toStringAsFixed(2),
            style: getRegularStyle(color: Colors.white),
          ),
          Image.network(
            product.image, // Use the imageCover property from Datum
            height: 110,
            width: 120,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 20),
          // Display the title of the product
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Column(
                  children: [
                    Text(
                      product.price.toStringAsFixed(2),
                      style: getRegularStyle(color: Colors.white),
                    ),
                    Text(
                      product.price.toStringAsFixed(2),
                      style: getRegularStyle(color: Colors.white),
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                    onTap: () {
                      ProductsCubit.get(context).changeCartAdded(product.id);
                      print(product.id);
                    },
                    child: Container(
                      width: 28,
                      height: 28,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 28,
                              height: 28,
                              decoration: ShapeDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment(0.67, -0.75),
                                  end: Alignment(-0.67, 0.75),
                                  colors: ProductsCubit.get(context)
                                              .cartadded[product.id] ??
                                          false
                                      ? [Colors.white, Color(0xFF4E5BB3)]
                                      : [Colors.grey, Colors.red],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              child: Center(
                                child: Icon(FeatherIcons.plus),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
              ]))
        ]));
  }
}
