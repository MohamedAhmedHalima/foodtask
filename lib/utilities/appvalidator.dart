import 'package:flutter/material.dart';
import 'package:foodtask/utilities/app_localize.dart';

class AppValidator {
  static String? validatorEmail(String value, BuildContext context) {
    const String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Field must not be empty';
    } else if (!regExp.hasMatch(value)) {
      return  'Please enter a valid email ex@gmail.com' ;
    }
    return null;
  }

  static String? validatorPassword(String value, BuildContext context) {
    // r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-5])(?=.*?[!@#\$&*~]).{6,}$';

    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-5]).{6,}$';
    RegExp regex = RegExp(pattern.toString());
    print(value);
    if (value.isEmpty) {
      return  'Field must not be empty' ;
    } else {
      if (value.length > 5) {
        return null;
         // if (!regex.hasMatch(value)) {
         //   return AppLocalize.of(context)!.trans('Please_enter_a_valid_password_ex');
         // } else {
         //   return null;
         // }
      } else {
        return  'The password must be more than item' ;
      }
    }
  }

}