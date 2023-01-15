import 'package:pattohou/models/repository/model/user_model.dart';

class SignUp {
  final String errorLastName;
  final String errorFirstName;
  final String errorPostalCode;
  final UserModel userModel;

  const SignUp(
      {required this.errorLastName,
      required this.errorFirstName,
      required this.errorPostalCode,
      required this.userModel});


  SignUp copyWith(
      {String? errorLastName,
      String? errorFirstName,
      String? errorPostalCode,
      UserModel? userModel}) {
    return SignUp(
        errorLastName: errorLastName ?? this.errorLastName,
        errorFirstName: errorFirstName ?? this.errorFirstName,
        errorPostalCode: errorPostalCode ?? this.errorPostalCode,
        userModel: userModel ?? this.userModel);
  }
}
