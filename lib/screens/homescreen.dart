import 'package:flutter/material.dart';
import 'package:shoeapp/components/appBar.dart';
import 'package:shoeapp/components/productList.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List category = [
    'All',
    'Adidas',
    'Nike',
    'Reedbok',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      backgroundColor: Color(0xFFF5F5F5),
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'Discover \nshoes weekly',
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
                  itemCount: category.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = i;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 45, right: 15),
                        child: Column(
                          children: [
                            Text(
                              category[i],
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: Color(0xFF000000),
                                fontSize: 25,
                                fontWeight: selectedIndex == i
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
            ProductList(),
          ],
        ),
      ),
    );
  }
}
