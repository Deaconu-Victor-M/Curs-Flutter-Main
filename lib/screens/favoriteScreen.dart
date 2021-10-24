import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoeapp/components/appBar.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: CustomAppBar(type: "favorites"),
      body: SafeArea(
        child: Column(
          children: [
            FavCard(),
          ],
        ),
      ),
    );
  }
}

class FavCard extends StatelessWidget {
  const FavCard({Key? key}) : super(key: key);

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
                  //TODO: Add brand & Shoe Name
                  Text(
                    'Rebook\nNano X Black',
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
                        '267.99 lei',
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
                //TODO: Replace with the image
                child: Placeholder(
                  fallbackWidth: 113,
                ),
              ),
            ],
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
