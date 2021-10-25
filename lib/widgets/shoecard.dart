import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoeapp/models/sneaker.dart';
import 'package:shoeapp/screens/detailScreen.dart';
import 'package:shoeapp/services/favoritesService.dart';

class ShoeCard extends StatefulWidget {
  const ShoeCard({
    Key? key,
    required this.sneaker,
    required this.isFavorite,
  }) : super(key: key);

  /// The product
  final Sneaker sneaker;

  final bool isFavorite;

  @override
  State<ShoeCard> createState() => _ShoeCardState();
}

class _ShoeCardState extends State<ShoeCard> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 70),
      child: RawMaterialButton(
        elevation: 0,
        fillColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                sneaker: widget.sneaker,
              ),
            ),
          );
        },
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
                      padding: const EdgeInsets.only(left: 35, bottom: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '${widget.sneaker.brand.capitalize()}\n${widget.sneaker.name}',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Color(0xFF000000),
                              fontSize: 20,
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
                                '${widget.sneaker.price} lei',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: Color(0xFF000000),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
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
                        FloatingActionButton(
                          // Each FAB requires a unique heroTag
                          heroTag: '${widget.sneaker.id}-fab',
                          backgroundColor: Colors.white,
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                              bottom: 8.0,
                              left: 8.0,
                              right: 8.0,
                            ),
                            child: SvgPicture.asset(
                              _isFavorite
                                  ? 'assets/svg/isLiked.svg'
                                  : 'assets/svg/isNotLiked.svg',
                              height: 50,
                              width: 50,
                              color: Colors.red,
                            ),
                          ),
                          onPressed: () async {
                            _isFavorite = !_isFavorite;
                            setState(() {});
                            final ids = await FavoritesService.getFavorites();
                            ids.add(widget.sneaker.id);
                            await FavoritesService.setFavorites(ids);
                          },
                        ),
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
              top: -50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: ProductImage(
                  radius: 20,
                  sneaker: widget.sneaker,
                  width: MediaQuery.of(context).size.width * 0.40,
                  height: MediaQuery.of(context).size.height * 0.18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.sneaker,
    required this.width,
    required this.height,
    required this.radius,
    required this.color,
  }) : super(key: key);

  final Sneaker sneaker;
  final double? width;
  final double? height;
  final double radius;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                sneaker.imageLink,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 70,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 1],
                colors: [
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.0),
                  color,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
