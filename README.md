# flutter_template

这是本人在学习Flutter过程中搭建的一个项目模板，希望能集成更多项目必备的模块，为后续快速构建项目打下基础。

项目结构如下：

```
lib/
├── main.dart
├── app/
│   ├── app.dart
│   ├── routes.dart
│   ├── themes.dart
│   └── localization.dart
├── core/
│   ├── constants/
│   │   ├── colors.dart
│   │   ├── strings.dart
│   │   └── app_config.dart
│   ├── utils/
│   │   ├── date_util.dart
│   │   ├── validators.dart
│   │   └── logger.dart
│   ├── services/
│   │   ├── api_service.dart
│   │   ├── local_storage_service.dart
│   │   ├── auth_service.dart
│   │   └── language_service.dart
│   └── models/
│       ├── user_model.dart
│       ├── recipe_model.dart
│       ├── ingredient_model.dart
│       └── vote_model.dart
├── features/
│   ├── home/
│   │   ├── ui/home_page.dart
│   │   ├── viewmodel/home_viewmodel.dart
│   │   └── widgets/home_header.dart
│   ├── profile/
│   │   ├── ui/profile_page.dart
│   │   ├── viewmodel/profile_viewmodel.dart
│   │   └── widgets/language_switch.dart
|   |   ...此处根据不同的业务增加不同模块
├── widgets/
│   ├── custom_button.dart
│   ├── loading_indicator.dart
│   ├── empty_state.dart
│   └── confirm_dialog.dart
├── l10n/
│   ├── intl_zh_CN.arb
│   ├── intl_en.arb
├── generated/
│   └── l10n.dart

```

目前已包含的模块：

* 多语言支持（中英文切换）
* 日志模块（基于logger，支持不同日志等级及日志过滤，支持格式化输出）

计划下一个模块：

* 思索中~

小伙伴有好的建议也请一起分享哦

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
