import 'package:clean/data/webservices/dto/response/base_response_dto.dart';
import 'package:clean/domain/model/login_result.dart';
import 'package:flutter/foundation.dart';

class LoginResponseDTO extends BaseResponseDTO {
  final String userId;
  final String token;

  const LoginResponseDTO({@required this.userId, @required this.token, @required error}) : super(error: error);

  factory LoginResponseDTO.fromJson(Map<String, dynamic> json) => LoginResponseDTO(
    userId: json['userId'],
    token: json['token'],
    error: json['error'],
  );

  @override
  List<Object> get props => [...super.props,userId,token];

}


extension LoginResponse on LoginResponseDTO {
  LoginResult toDomain() => LoginResult(
    token: this.token ?? "",
    userId: this.userId ?? "",
    error: this.error ?? ""
  );
}

