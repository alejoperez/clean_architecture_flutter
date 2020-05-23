import 'package:clean/app_localizations.dart';
import 'package:clean/data/repositories/user/user_data_source_contracts.dart';
import 'package:clean/data/repositories/user/user_local_data_source.dart';
import 'package:clean/data/repositories/user/user_remote_data_source.dart';
import 'package:clean/data/repositories/user/user_repository.dart';
import 'package:clean/data/webservices/api/user_api.dart';
import 'package:clean/domain/use_cases/login/login_use_case.dart';
import 'package:clean/presentation/login/login_screen.dart';
import 'package:clean/presentation/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

GetIt locator = GetIt.instance;

void initDependencyInjection() {
  locator.registerLazySingleton<IUserRepository>(() => UserRepository());
  locator.registerLazySingleton<IUserLocalDataSource>(() => UserLocalDataSource());
  locator.registerLazySingleton<IUserRemoteDataSource>(() => UserRemoteDataSource());
  locator.registerLazySingleton(() => UserApi());
  locator.registerLazySingleton<ILoginUseCase>(() => LoginUseCase());
}

void main() {
  initDependencyInjection();
  runApp(SampleApp());
}

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Architecture Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.redAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoginViewModel())
        ],
        child: LoginScreen(),
      ),
      supportedLocales: [
        Locale('es', 'ES'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}