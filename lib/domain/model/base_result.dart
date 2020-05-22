import 'package:flutter/foundation.dart';

class BaseResult {
  final String error;
  const BaseResult({@required this.error}): assert(error != null);
}