
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage{

  // set favorite
   static Future<bool> setFav(List<String> fav)async{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      bool _fav = await sharedPreferences.setStringList("fav",fav);
      return _fav;
   }

    // get Favorite
    static Future<List<String>> getFav()async{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      List<String> _fav = await sharedPreferences.getStringList("fav")!.toList() ?? [];
      return _fav;
   }

}