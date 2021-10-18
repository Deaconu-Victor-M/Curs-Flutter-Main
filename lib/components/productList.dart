import 'package:flutter/material.dart';
import 'package:shoeapp/models/sneaker.dart';
import 'package:shoeapp/widgets/shoecard.dart';

class ProductList extends StatefulWidget {
  const ProductList({
    Key? key,
    required this.sneakers,
    required this.favorites,
  }) : super(key: key);

  final List<Sneaker>? sneakers;

  final List<String> favorites;

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  bool _isInFavoritesList(String id) {
    bool found = false;
    widget.favorites.forEach((favId) {
      if (favId == id) {
        found = true;
      }
    });
    return found;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.sneakers == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Text(
            "Oops, Failed to get data :(",
            style: TextStyle(fontSize: 24),
          ),
        ),
      );
    } else {
      return Expanded(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: widget.sneakers?.length,
          itemBuilder: buildListView,
        ),
      );
    }
  }

  Widget buildListView(BuildContext context, int index) {
    if (widget.sneakers == null) {
      return Text('fail.');
    }

    return ShoeCard(
      sneaker: widget.sneakers![index],
      isFavorite: _isInFavoritesList(widget.sneakers![index].id),
    );
  }
}
