import 'package:clean/presentation/base/app/app_localizations.dart';
import 'package:clean/presentation/login/login_screen.dart';
import 'package:clean/presentation/login/login_view_model.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class App extends StatelessWidget {
  static String _appTitle = "Clean Architecture Demo";
  static Color _primaryColor = Colors.blue;
  static Color _accentColor = Colors.redAccent;

  @override
  Widget build(BuildContext context) {

    if (UniversalPlatform.isIOS) {
      return CupertinoApp(
        title: _appTitle,
        theme: CupertinoThemeData(
          primaryColor: _primaryColor,
          primaryContrastingColor: _accentColor,
        ),
        home: _buildMultiProviderHome(),
        supportedLocales: _supportedLocaleList(),
        localizationsDelegates: _localizationsDelegateList(),
        localeResolutionCallback: _localeResolutionCallback,
      );
    }

    return MaterialApp(
      title: _appTitle,
      theme: ThemeData(
        primarySwatch: _primaryColor,
        accentColor: _accentColor,
      ),
      home: _buildMultiProviderHome(),
      supportedLocales: _supportedLocaleList(),
      localizationsDelegates: _localizationsDelegateList(),
      localeResolutionCallback: _localeResolutionCallback,
    );
  }

  MultiProvider _buildMultiProviderHome() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel())
      ],
      child: LoginScreen(),
    );
  }

  List<Locale> _supportedLocaleList() {
    return [
      Locale('es', 'ES'),
      Locale('en', 'US'),
    ];
  }

  List<LocalizationsDelegate> _localizationsDelegateList() {
    return [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ];
  }

  Locale _localeResolutionCallback(locale, supportedLocales) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return supportedLocale;
        }
      }
      return supportedLocales.first;
    }
}
