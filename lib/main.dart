import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/app.dart';
import 'core/services/language_service.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => LanguageService(),
    child: const App(),
  ));
}

