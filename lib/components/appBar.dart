import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoeapp/screens/favoriteScreen.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.type}) : super(key: key);

  final String type;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  String _getTitle() {
    switch (type) {
      case "home":
        return "Home";
      case "favorites":
        return "Favorites";
      case "detail":
        return "Details";
      default:
        return "Unknown";
    }
  }

  String _getSVGPath() {
    switch (type) {
      case "home":
        return 'assets/svg/menu.svg';
      case "favorites":
        return 'assets/svg/arrow-left.svg';
      case "detail":
        return 'assets/svg/arrow-left.svg';
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      toolbarHeight: 100,
      backgroundColor: Color(0xFFF5F5F5),
      title: Text(
        _getTitle(),
        style: TextStyle(
          fontFamily: 'Inter',
          color: Colors.black,
          fontSize: 40,
          fontWeight: FontWeight.w500,
        ),
      ),
      leadingWidth: 70,
      leading: IconButton(
        onPressed: () {
          switch (type) {
            case "home":
              Scaffold.of(context).openDrawer();
              break;
            case "favorites":
              Navigator.pop(context);
              break;
            case "detail":
              Navigator.pop(context);
              break;
            default:
              throw Exception("Not implemented");
          }
        },
        icon: SvgPicture.asset(_getSVGPath()),
      ),
      actions: type == 'home'
          ? [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  // Each FAB requires a unique heroTag
                  heroTag: '$type-fab',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FavoriteScreen(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 8.0,
                      right: 8.0,
                      bottom: 8.0,
                    ),
                    child: SvgPicture.asset(
                      'assets/svg/isNotLiked.svg',
                      color: Colors.white.withAlpha(150),
                    ),
                  ),
                  backgroundColor: Colors.grey.withAlpha(100),
                  elevation: 0,
                ),
              ),
            ]
          : null,
    );
  }
}
