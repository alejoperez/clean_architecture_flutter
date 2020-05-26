import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class BaseResult extends Equatable {
  final String error;
  const BaseResult({@required this.error}): assert(error != null);
  @override
  List<Object> get props => [error];

  @override
  bool get stringify => true;
}