import 'package:flutter/material.dart';



class DiscountCard extends StatelessWidget {
  final String image;
  const DiscountCard({
    Key ?key, required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Container(

            width: double.infinity,
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),

            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    Color(0xff437ed6).withOpacity(0.7),
                    Color(0xff33a6df).withOpacity(0.7),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: <Widget>[

                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.white),
                          children: [
                            TextSpan(
                              text: "Get Discount of \n",
                              style: TextStyle(fontSize: 16),
                            ),
                            TextSpan(
                              text: "80% \n",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text:
                              "at MacDonald's on your first order & Instant cashback",
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),

                    ),
                    SizedBox(

                      height:80,
                      child: Image.asset(

                          image),
                    ),
                  ],
                ),

              ),
            ),
          ),
        ],
      ),
    );
  }
}