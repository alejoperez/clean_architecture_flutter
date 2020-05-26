import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class BaseResponseDTO extends Equatable {
  final String error;

  const BaseResponseDTO({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  bool get stringify => true;
}
