import 'dart:convert';
import 'package:clean/data/webservices/dto/request/login_request_dto.dart';
import 'package:clean/data/webservices/dto/response/login_response_dto.dart';
import 'package:clean/flavor_config.dart';
import 'package:http/http.dart' as http;

class UserApi {

  // API Services
  static const _LOGIN = "/login";

  Future<LoginResponseDTO> login(LoginRequest request) async {
    try {
      final rawResponse = await http.get("${FlavorConfig.userBaseUrl}$_LOGIN");
      final jsonResponse = json.decode(rawResponse.body) as Map<String, dynamic>;
      return LoginResponseDTO.fromJson(jsonResponse);

    } catch (error) {
      print(error);
      rethrow;
    }
  }


}