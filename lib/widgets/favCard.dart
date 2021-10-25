import 'package:flutter/material.dart';
import 'package:shoeapp/helpers/stringExtensions.dart';
import 'package:shoeapp/models/sneaker.dart';
import 'package:shoeapp/screens/detailScreen.dart';

class FavCard extends StatelessWidget {
  const FavCard({Key? key, required this.sneaker}) : super(key: key);

  final Sneaker sneaker;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Container(
        height: 129,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: RawMaterialButton(
          elevation: 1,
          fillColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${sneaker.brand.capitalize()}\n${sneaker.name}'
                        .truncate(24),
                    style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/money.png',
                        scale: 17,
                        color: Color(0xFF6C6DDE),
                      ),
                      Text(
                        '${sneaker.price} lei',
                        style: TextStyle(
                          color: Color(0xFF6C6DDE),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Container(
                  width: 82,
                  height: 82,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        sneaker.imageLink,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  sneaker: sneaker,
                  skipFetch: true,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
