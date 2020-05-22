import 'dart:convert';
import 'package:clean/data/webservices/dto/request/login_request_dto.dart';
import 'package:clean/data/webservices/dto/response/login_response_dto.dart';
import 'package:http/http.dart' as http;

class UserApi {

  //Base URL
  static const _USER_BASE_URL = "https://3e727e70-5db1-40a3-b5e1-7ff2646ab4d1.mock.pstmn.io";
  // API Services
  static const _LOGIN = "/login";

  Future<LoginResponseDTO> login(LoginRequest request) async {
    try {
      final rawResponse = await http.get("$_USER_BASE_URL$_LOGIN");
      final jsonResponse = json.decode(rawResponse.body) as Map<String, dynamic>;
      return LoginResponseDTO.fromJson(jsonResponse);

    } catch (error) {
      print(error);
      rethrow;
    }
  }


}