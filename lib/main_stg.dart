import 'package:clean/flavor_config.dart';
import 'package:clean/presentation/base/app/app.dart';
import 'package:clean/presentation/base/app/dependency_injection.dart';
import 'package:flutter/material.dart';

void main() {
  FlavorConfig.appFlavor = Flavor.STG;
  DependencyInjection.init();
  runApp(App());
}
