import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/services/language_service.dart';
import '../../generated/l10n.dart'; // Flutter Intl生成的本地化类

class LanguageTestPage extends StatelessWidget {
  const LanguageTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final languageService = Provider.of<LanguageService>(context);
    final locale = languageService.locale;

    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.current.title,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final isChinese = locale.languageCode == 'zh';
                languageService.changeLocale(
                  isChinese ? const Locale('en') : const Locale('zh', 'CN'),
                );
              },
              child: Text(S.current.button),
            ),
          ],
        ),
      ),
    );
  }
}
