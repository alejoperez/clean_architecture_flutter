import 'package:clean/flavor_config.dart';
import 'package:clean/presentation/base/app/app.dart';
import 'package:clean/presentation/base/app/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';

void main() {
  FlavorConfig.appFlavor = Flavor.DEV;
  DependencyInjection.init();
  runApp(App());

}
