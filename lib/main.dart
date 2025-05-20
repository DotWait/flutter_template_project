import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'app/app.dart';
import 'core/services/language_service.dart';
import 'core/utils/logger.dart';

void main() {
  AppLogger.init(
    level: Level.debug,
  );

  // 测试用日志，后续删除 TODO 删除
  AppLogger.t("trace msg");
  AppLogger.d("debug msg");
  AppLogger.i("info msg");
  AppLogger.w("warning msg");
  AppLogger.e("error msg");


  runApp(ChangeNotifierProvider(
    create: (_) => LanguageService(),
    child: const App(),
  ));
}

