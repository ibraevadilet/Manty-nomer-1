// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ru = {
  "catchExTimeOfProcessing": "Превышено время обработки запроса.\nПовторите позднее",
  "catchExNoInternet": "Нет интернет соединения",
  "catchExRequestDenied": "Запрос отклонен",
  "catchExLoginNotFound": "Неверный логин или пароль",
  "catchExSystemError": "Произошла системная ошибка",
  "catchExSessionExpired": "Ваша сессия истекла. Просьба авторизоваться повторно!",
  "retry": "Повторить попытку"
};
static const Map<String,dynamic> ky = {
  "catchExTimeOfProcessing": "Сурамды иштеп чыгуу убактысынан ашып кетти.\nАракетти бир аздан кийин кайталаңыз",
  "catchExNoInternet": "Интернет байланышы жок",
  "catchExRequestDenied": "Сурам четке кагылды",
  "catchExLoginNotFound": "Бул логин табылган жок",
  "catchExSystemError": "Системадан ката кетти",
  "catchExSessionExpired": "Сиздин сесссияңыз аяктады. Кайрадан авторизациялоодон өтүүнү суранабыз!",
  "retry": "Аракетти кайталаңыз"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ru": ru, "ky": ky};
}
