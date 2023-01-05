import 'package:exam_prep/data/app_pref/shared_app_pref.dart';
import 'package:exam_prep/repository/user_repository/model/user_type.dart';
import 'package:exam_prep/repository/user_repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl({
    required this.appPrefsClient,
  });

  final AppPrefs appPrefsClient;

  static const String prefsToken = "APP_TOKEN";
  static const String prefsUserType = "APP_USER_TYPE";
  static const String prefsUserName = "APP_USER_NAME";
  static const String prefsLoggedInStatus = "APP_LOGGED_IN_STATUS";
  static const String prefsTestDataList = "AP_TEST_DATA_LIST";

  @override
  String? get userName => appPrefsClient.getString(prefsUserName);

  @override
  set userName(String? value) => appPrefsClient.setString(prefsUserName, value);

  @override
  String? get passwordToken => appPrefsClient.getString(prefsToken);
  @override
  set passwordToken(String? value) =>
      appPrefsClient.setString(prefsToken, value);

  @override
  bool get isUserLoggedIn =>
      appPrefsClient.getBool(prefsLoggedInStatus) ?? false;

  @override
  set isUserLoggedIn(bool value) =>
      appPrefsClient.setBool(prefsLoggedInStatus, value);

  @override
  set userType(UserType value) =>
      appPrefsClient.setInt(prefsUserType, value.intValue);
  @override
  UserType get userType =>
      getUserTypeFromInt(appPrefsClient.getInt(prefsUserType) ?? -1);

  @override
  List<String> get testDataList =>
      appPrefsClient.getStringList(prefsTestDataList) ?? [];

  @override
  set testDataList(List<String> data) =>
      appPrefsClient.setStringList(prefsTestDataList, data);
}
