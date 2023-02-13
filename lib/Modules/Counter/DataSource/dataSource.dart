import 'package:shared_preferences/shared_preferences.dart';

class Sherdpref {
  SharedPreferences sharedPreferences;
  late int count;
  Sherdpref(this.sharedPreferences,this.count);
  void set(){
    try {
      sharedPreferences.setInt('counter', count );
    } catch(e){
      print(e);
    }
  }
   get ()async{
    int countt=await sharedPreferences.getInt('counter')??0 ;
    return countt;
  }


}