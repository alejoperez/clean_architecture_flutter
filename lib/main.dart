import 'package:core/core.dart';
import 'package:onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void initDependencyInjection() {
  initCoreDependencyInjection();
  initOnboardingDependencyInjection();
}

void main() {
  initDependencyInjection();
  runApp(SampleApp());
}

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Architecture Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoginViewModel())
        ],
        child: LoginScreen(),
      ),
    );
  }
}