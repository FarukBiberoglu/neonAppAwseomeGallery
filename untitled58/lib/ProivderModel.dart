import 'package:flutter/cupertino.dart';

class FavoriteModel extends ChangeNotifier {
  List<String> myFavoritePage = [
  ];

  List<String> get favoriteImages => myFavoritePage;

  void addFavorite(String image ){
     favoriteImages.add(image);
     notifyListeners();

  }

  void removeImages (String image ){
    favoriteImages.remove(image);
    notifyListeners();
  }

}