import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../shared/resources/app_constances.dart';

class AppLocalize {
  AppLocalize(this.locale);

  final Locale locale;

  static AppLocalize? of(BuildContext context) {
    return Localizations.of<AppLocalize>(context, AppLocalize);
  }

  late Map<String, String> _sentences;

  Future<bool> load() async {
    String data =
    await rootBundle.loadString('assets/i18n/${locale.languageCode}.json');
    Map<String, dynamic> result = json.decode(data);

    _sentences = {};
    result.forEach((String key, dynamic value) {
      _sentences[key] = value.toString();
    });

    return true;
  }

  String trans(String key) {
    return _sentences[key] ?? key;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalize> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppConstances.appLangs.contains(locale.languageCode);

  @override
  Future<AppLocalize> load(Locale locale) async {
    AppLocalize localizations = AppLocalize(locale);
    await localizations.load();

    debugPrint("Load ${locale.languageCode}");

    return localizations;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}