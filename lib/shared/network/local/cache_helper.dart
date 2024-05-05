import 'dart:convert';

import 'package:foodtask/model/list_of_recipes_model.dart';
import 'package:shared_preferences/shared_preferences.dart';



class CacheHelper {
  static bool isAuth = false;
  static   List<ListOfRecipesModel> ? listOfRecipesModel  ;


  static Future<void> setAuth(bool isAuth) async {
    CacheHelper.isAuth = isAuth;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isAuth", isAuth);
  }

  static Future<void> getAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("isAuth")) {
      isAuth = prefs.getBool("isAuth")!;
    }
  }

  // static Future<void> setIsRememberMe(bool value) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setBool('isRememberMe', value);
  //   isRememberMe = value;
  // }
  //
  //
  // static Future<bool?> getIsRememberMe() async {
  //   final SharedPreferences pref = await SharedPreferences.getInstance();
  //   isRememberMe = pref.getBool('isRememberMe');
  //   return isRememberMe;
  // }
  //
  // static Future<bool> setLang(String value) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   lang = value;
  //   return prefs.setString('Lang', value);
  // }
  //
  // static Future<void> getLang() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   lang = prefs.getString('Lang')??"en";
  // }
  //


  static Future<List<ListOfRecipesModel>? > getListOfRecipesModel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? result = prefs.getStringList("listOfRecipesModel");
    if (result != null) {
      listOfRecipesModel =result
          .map((jsonString) => ListOfRecipesModel.fromJson(jsonDecode(jsonString)))
          .toList();

       return listOfRecipesModel;
    }
    return null;
  }


  static Future<void> saveListOfRecipesModel(List<ListOfRecipesModel>? list) async {
    listOfRecipesModel = list;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> listOfModel =
    list!.map((model) => jsonEncode(model.toJson())).toList();
    await prefs.setStringList("listOfRecipesModel", listOfModel);
  }

}
