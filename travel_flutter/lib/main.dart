import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_flutter/routes/app_routes.dart';
import 'package:travel_flutter/shared/theme/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 初始化 EasyLocalization
  await EasyLocalization.ensureInitialized();

  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('zh', 'Hant')],
        path: 'assets/translations',
        startLocale: Locale('zh', 'Hant'),
        fallbackLocale: Locale('zh', 'Hant'),
        saveLocale: true,
        useOnlyLangCode: false,
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primary500Color),
        useMaterial3: true,
      ),
    );
  }
}
