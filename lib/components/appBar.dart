import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      toolbarHeight: 100,
      backgroundColor: Color(0xFFF5F5F5),
      title: Text(
        'Home',
        style: TextStyle(
          fontFamily: 'Inter',
          color: Colors.black,
          fontSize: 45,
          fontWeight: FontWeight.w600,
        ),
      ),
      leadingWidth: 70,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset('assets/svg/menu.svg'),
      ),
    );
  }
}
