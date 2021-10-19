import 'package:flutter/material.dart';
import 'package:shoeapp/components/appBar.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({ Key? key }) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(type: "favorites"),
      body: SafeArea(child: Column(
        children: [],
      ),
      ),
    );
  }
}