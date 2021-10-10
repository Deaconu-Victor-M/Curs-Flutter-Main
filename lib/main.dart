import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoeapp/screens/homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /// Set orientation to portrait only
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoey',
      theme: ThemeData(
        primaryColor: Colors.black,
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.grey,
        ).copyWith(
          secondary: Color(0xFF6C6DDE),
        ),
      ),
      home: HomePage(),
    );
  }
}
