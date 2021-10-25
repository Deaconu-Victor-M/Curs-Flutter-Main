import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoeapp/components/appBar.dart';
import 'package:shoeapp/components/loading.dart';
import 'package:shoeapp/models/sneaker.dart';
import 'package:shoeapp/services/apiService.dart';
import 'package:shoeapp/services/favoritesService.dart';
import 'package:shoeapp/widgets/favCard.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  bool _isLoading = true;
  List<Sneaker?> _favorites = [];

  @override
  void initState() {
    super.initState();
    FavoritesService.getFavorites().then((favs) {
      _isLoading = false;
      favs.forEach((fav) {
        APIService.getSneakerByID(fav).then((sneaker) {
          _favorites.add(sneaker);
          setState(() {});
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: CustomAppBar(type: "favorites"),
      body: _isLoading
          ? Loading()
          : SafeArea(
              child: ListView.builder(
                itemCount: _favorites.length,
                itemBuilder: (context, index) {
                  final current = _favorites[index];
                  // Only render a card if the sneaker at index is not null!
                  return current != null
                      ? FavCard(sneaker: current)
                      : Container();
                },
              ),
            ),
    );
  }
}
