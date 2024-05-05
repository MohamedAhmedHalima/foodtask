import 'package:flutter/services.dart';

class SystemUiOverlayStyles {
  static const SystemUiOverlayStyle lightStatusBarStyle = SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
  );

  static const SystemUiOverlayStyle darkStatusBarStyle = SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
  );
}