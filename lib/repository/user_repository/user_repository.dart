import 'package:exam_prep/repository/user_repository/model/user_type.dart';

abstract class UserRepository {
  String? get userName;

  set userName(String? value);

  String? get passwordToken;

  set passwordToken(String? value);

  bool get isUserLoggedIn;

  set isUserLoggedIn(bool value);

  set userType(UserType value);

  UserType get userType;

  List<String> get testDataList;

  set testDataList(List<String> data);
}
