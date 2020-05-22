import 'user_data_source_contracts.dart';

class UserLocalDataSource implements IUserLocalDataSource {
  @override
  Future<String> getAuthToken() async {
    return "token";
  }

}