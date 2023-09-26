import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setting_apps/controller/setting_controller.dart';
import 'package:setting_apps/views/setting_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:setting_apps/views/setting_view_selector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SettingController>(
      create: (context) {
        return SettingController();
      },
      child: Builder(builder: (context) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'Flutter Demo',
          theme: Provider.of<SettingController>(context).isDark
              ? ThemeData.dark()
              : ThemeData.light(),
          home: const SettingViewSelector(),
        );
      }),
    );
  }
}
