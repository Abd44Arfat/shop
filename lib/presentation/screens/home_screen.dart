import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:untitled/presentation/screens/widgets/Discount%20card.dart';
import 'package:untitled/presentation/screens/widgets/custom_app_bar.dart';
import 'package:untitled/presentation/screens/widgets/custom_product_card.dart';
import 'package:untitled/presentation/screens/widgets/custom_text_field.dart';
import 'package:untitled/presentation/screens/widgets/horiztional_list_products.dart';

import '../../models/products_model.dart';
import 'custom dots.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body:Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(child: Column(
          children: [
            CustomAppBar(),
            CustomFormTextField(icon: FeatherIcons.search,),
            DiscountCardCarousel(),
            SizedBox(height: 10,),
            FilterationList(),
            SizedBox(height: 10,),

            HorizontalProductList()
          ],
        ),
        ),
      ) ,
      
    );
  }
}
class FilterationList extends StatelessWidget {
  const FilterationList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40, // Set the desired height
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              width: 88,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff262626),
              ),
              child: Center(child: Text('Poplar',style: TextStyle(color: Colors.white),)),
            ),
          );
        },
      ),
    );
  }
}
class DiscountCardCarousel extends StatefulWidget {
  @override
  _DiscountCardCarouselState createState() => _DiscountCardCarouselState();
}

class _DiscountCardCarouselState extends State<DiscountCardCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: [
            DiscountCard(image: 'assets/images/prod3.png'),
            DiscountCard(image: 'assets/images/slider4.png'),
            DiscountCard(image: 'assets/images/th.png'),
          ],
          options: CarouselOptions(
            // enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 1),
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              }
          ),
        ),
        CustomDots(
          dotIndex: _currentIndex.toDouble(),
        ),
      ],
    );
  }
}
