import 'package:flutter/material.dart';
import 'package:shoeapp/models/sneaker.dart';
import 'package:shoeapp/services/apiService.dart';
import 'package:shoeapp/widgets/shoecard.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Sneaker>? _sneakers = [];

  Future<void> _getData() async {
    print('Getting data...');
    _sneakers = await APIService.getAllSneakers();
    print('Done!');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (_sneakers == null) {
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
                itemCount: _sneakers?.length,
                itemBuilder: buildListView,
              ),
            );
          }
        }
      },
    );
  }

  Widget buildListView(BuildContext context, int index) {
    if (_sneakers == null) {
      return Text('fail.');
    }

    return ShoeCard(sneaker: _sneakers![index]);
  }
}
