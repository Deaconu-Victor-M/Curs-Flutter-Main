import 'package:shared_preferences/shared_preferences.dart';

class FavoritesService {
  static const FAVORITES_KEY = "shoeapp.favorites";

  /// Get a list of the saved sneaker's IDs
  static Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(FAVORITES_KEY) ?? [];
  }

  /// Save the favorites list
  static Future<void> setFavorites(List<String> ids) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(FAVORITES_KEY, ids);
  }
}
