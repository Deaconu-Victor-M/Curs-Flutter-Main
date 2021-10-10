import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoeapp/widgets/shoecard.dart';

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
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              floating: true,
              centerTitle: true,
              pinned: true,
              elevation: 0,
              collapsedHeight: 80,
              expandedHeight: 240,
              backgroundColor: Color(0xFFF5F5F5),
              title: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Home',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.black,
                      fontSize: 45,
                      fontWeight: FontWeight.w600),
                ),
              ),
              leadingWidth: 60,
              leading: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 0),
                child: Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: SvgPicture.asset('assets/svg/menu.svg'),
                ),
              ),
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(top: 100, left: 20),
                child: Text(
                  'Discover \nshoes weekly',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      color: Color(0xFF6C6DDE),
                      fontSize: 45,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SliverAppBar(
              elevation: 0,
              pinned: true,
              backgroundColor: Color(0xFFF5F5F5),
              toolbarHeight: 40,
              flexibleSpace: ListView.builder(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
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
                                    : FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((_, i) {
                return ShoeCard(
                  name: 'Rebook\nNano X Black',
                  price: 267.99,
                );
              }, childCount: 5),
            ),
          ],
        ),
      ),
    );
  }
}
