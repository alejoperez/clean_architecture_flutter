import 'package:clean/data/repositories/user/user_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('UserLocalDataSource', () {
    test('Token - Local Storage', () async {
      SharedPreferences.setMockInitialValues({});
      final userLocalDataSource = UserLocalDataSource();
      String token = await userLocalDataSource.getAuthToken();
      expect(token, null);

      userLocalDataSource.saveAuthToken("token");

      token = await userLocalDataSource.getAuthToken();
      expect(token, "token");

    });
  });
}