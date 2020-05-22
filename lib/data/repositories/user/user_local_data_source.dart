import 'user_data_source_contracts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocalDataSource implements IUserLocalDataSource {
  static const _AUTH_TOKEN = "auth_token";
  @override
  Future<String> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_AUTH_TOKEN);
  }

  @override
  void saveAuthToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_AUTH_TOKEN, token);
  }

}