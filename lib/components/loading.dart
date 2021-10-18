import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: Color(0xFF6C6DDE),
          ),
          SizedBox(height: 20),
          Text(
            'Loading',
            style: TextStyle(
              fontFamily: 'Inter',
              color: Color(0xFF6C6DDE),
              fontSize: 46,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
