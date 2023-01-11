
import 'package:pattohou/models/repository/model/user_model.dart';

class SignUp{
  const SignUp({required this.errorLastName, required this.errorFirstName, required this.userModel});

  final String errorLastName;
  final String errorFirstName;
  final UserModel userModel;

  SignUp copyWith({String? errorLastName, String? errorFirstName, UserModel? userModel}){
    return SignUp(
        errorLastName: errorLastName ?? this.errorLastName,
        errorFirstName: errorFirstName ?? this.errorFirstName,
        userModel: userModel ?? this.userModel);
  }
}