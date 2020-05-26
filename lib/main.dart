import 'package:clean/presentation/base/app/app.dart';
import 'package:clean/presentation/base/app/dependency_injection.dart';
import 'package:flutter/material.dart';

void main() {
  DependencyInjection.init();
  runApp(App());
}
