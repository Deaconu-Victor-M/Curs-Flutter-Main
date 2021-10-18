import 'package:flutter/material.dart';
import 'package:shoeapp/components/appBar.dart';
import 'package:shoeapp/components/loading.dart';
import 'package:shoeapp/components/productList.dart';
import 'package:shoeapp/models/sneaker.dart';
import 'package:shoeapp/services/apiService.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List _category = [
    'All',
    'Adidas',
    'Nike',
    'Reebok',
  ];

  bool _isLoading = true;
  List<Sneaker>? _sneakers = [];

  @override
  void initState() {
    super.initState();
    print("----- Getting sneakers -----");
    APIService.getAllSneakers().then((sneakers) {
      _sneakers = sneakers;
      _isLoading = false;
      setState(() {});
      print("----- Done -----");
    });
  }

  List<Sneaker>? _getSneakersForCategory(String category) {
    if (_sneakers == null) {
      return null;
    }

    if (category == "All") {
      return _sneakers;
    }

    List<Sneaker> sortedList = [];
    _sneakers!.forEach((sneaker) {
      if (sneaker.brand == category.toLowerCase()) {
        sortedList.add(sneaker);
      }
    });
    return sortedList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      extendBody: false,
      backgroundColor: Color(0xFFF5F5F5),
      appBar: CustomAppBar(),
      body: _isLoading
          ? Loading()
          : SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      'Discover\nshoes weekly',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        color: Color(0xFF6C6DDE),
                        fontSize: 45,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics(),
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: _category.length,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  _selectedIndex = i;
                                },
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 45,
                                right: 15,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    _category[i],
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Color(0xFF000000),
                                      fontSize: 25,
                                      fontWeight: _selectedIndex == i
                                          ? FontWeight.bold
                                          : FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  /// "Main" product list
                  ProductList(
                    sneakers: _getSneakersForCategory(
                      _category[_selectedIndex],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
