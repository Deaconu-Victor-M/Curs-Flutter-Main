import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoeapp/components/appBar.dart';
import 'package:shoeapp/components/loading.dart';
import 'package:shoeapp/models/sneaker.dart';
import 'package:shoeapp/services/apiService.dart';
import 'package:shoeapp/widgets/shoecard.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    Key? key,
    required this.sneaker,
  }) : super(key: key);
  final Sneaker sneaker;
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

class _DetailScreenState extends State<DetailScreen> {
  Sneaker? _currentSneaker;

  Future<void> _getSneakerDetails() async {
    _currentSneaker = await APIService.getSneakerByID(widget.sneaker.id);
  }

  Widget _buildButton() {
    return SizedBox(
      height: 73,
      width: MediaQuery.of(context).size.width * 0.50,
      child: RawMaterialButton(
        elevation: 0,
        fillColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(23),
        ),
        onPressed: () {
          launch(_currentSneaker?.pageUrl ?? '');
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Go shopping',
              style: TextStyle(
                fontFamily: 'Inter',
                color: Color(0xFFFFFFFF),
                fontSize: 21,
                fontWeight: FontWeight.w400,
              ),
            ),
            SvgPicture.asset('assets/svg/chevron-circle-up-Filled.svg')
          ],
        ),
      ),
    );
  }

  Widget _bottomDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          '${widget.sneaker.price} lei',
          style: TextStyle(
            fontFamily: 'Inter',
            color: Color(0xFF000000),
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
        ),
        _buildButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: CustomAppBar(type: "detail"),
      body: FutureBuilder(
        future: _getSneakerDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Loading();
          } else {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.42,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ProductImage(
                          color: Color(0xFFF5F5F5),
                          radius: 25,
                          sneaker: _currentSneaker!,
                          width: MediaQuery.of(context).size.width * 0.70,
                          height: MediaQuery.of(context).size.height * 0.30,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.5,
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          padding: EdgeInsets.all(3.0),
                          child: ProductImage(
                            color: Color(0xFFF5F5F5),
                            radius: 13,
                            sneaker: _currentSneaker!,
                            width: MediaQuery.of(context).size.height * 0.06,
                            height: MediaQuery.of(context).size.height * 0.06,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox.expand(
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: DraggableScrollableSheet(
                      initialChildSize: 0.47,
                      minChildSize: 0.45,
                      maxChildSize: 0.52,
                      builder: (context, scrollController) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35),
                              topRight: Radius.circular(35),
                            ),
                          ),
                          child: SingleChildScrollView(
                            //physics: BouncingScrollPhysics(),
                            //physics: ScrollPhysics( parent: ),
                            controller: scrollController,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 110, vertical: 10),
                                  child: Container(
                                    height: 6,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 49),
                                  child: Text(
                                    '${_currentSneaker?.brand.capitalize()}\n${_currentSneaker?.name}',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Color(0xFF000000),
                                      fontSize: 36,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 49, right: 49),
                                  child: Text(
                                    _currentSneaker?.description ??
                                        "Something went wrong...",
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      color: Color(0xFF000000),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.20,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 15,
                          blurRadius: 10,
                          offset: Offset(3, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 5),
                      child: _bottomDetail(),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
