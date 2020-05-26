import 'package:clean/domain/model/base_result.dart';
import 'package:flutter/foundation.dart';

class LoginResult extends BaseResult {
  final String userId;
  final String token;

  const LoginResult(
      {@required this.userId, @required this.token, @required error})
      : assert(userId != null),
        assert(token != null),
        super(error: error);

  @override
  List<Object> get props => [...super.props,userId,token];
}
