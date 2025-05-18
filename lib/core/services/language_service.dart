import 'package:flutter/material.dart';

class LanguageService with ChangeNotifier {
  Locale _locale = const Locale('zh','CN'); // 默认语言为中文

  Locale get locale => _locale;

  void setLocale(Locale newLocale) {
    if (_locale == newLocale) return;
    _locale = newLocale;
    notifyListeners();
  }

  void switchToChinese() {
    setLocale(const Locale('zh', 'CN'));
  }

  void switchToEnglish() {
    setLocale(const Locale('en'));
  }

  /// 切换语言的方法
  void changeLocale(Locale newLocale) {
    if (_locale == newLocale) return;

    _locale = newLocale;
    notifyListeners(); // 通知 UI 更新
  }
}
