import 'package:flutter/foundation.dart';

class LoginRequest {
  final String email;
  final String password;

  const LoginRequest({@required this.email, @required this.password});
}
