import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShoeCard extends StatelessWidget {
  const ShoeCard({
    Key? key,
    required this.name,
    required this.price,
  }) : super(key: key);

  /// Name of the product
  final String name;

  /// Price of the product
  final double price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 70),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            height: 230,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 35, top: 110),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Color(0xFF000000),
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/money.png',
                              scale: 17,
                              color: Colors.black,
                            ),
                            Text(
                              '$price lei',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xFF000000),
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 103,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(11),
                            bottomRight: Radius.circular(11),
                          ),
                        ),
                      ),
                      SvgPicture.asset(
                          'assets/svg/isNotLiked.svg', //: 'assets/svg/isLiked.svg',
                          height: 50,
                          width: 50,
                          color: Colors.red),
                      Container(
                        height: 36,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(11),
                            topRight: Radius.circular(11),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: -40,
            left: 30,
            child: Stack(
              children: [
                Container(
                  height: 112,
                  width: 181,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 70,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.3, 1],
                        colors: [
                          Theme.of(context)
                              .scaffoldBackgroundColor
                              .withOpacity(0.0),
                          Colors.white
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
