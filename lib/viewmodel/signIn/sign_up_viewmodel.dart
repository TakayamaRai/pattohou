import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pattohou/models/local/model/sign_up_model.dart';
import 'package:pattohou/models/repository/model/user_model.dart';
import 'package:pattohou/viewmodel/common/validator.dart';


final signUpProvider = StateNotifierProvider.autoDispose<SignUpNotifier,SignUp>((ref) {
  return SignUpNotifier(ref.read);
});

class SignUpNotifier extends StateNotifier<SignUp>{
  final Reader _read;

  SignUpNotifier(this._read) : super(SignUp(errorLastName: "", errorFirstName: "", userModel: UserModel.empty()));
  final validator = Validator();


  void lastNameValidator({required String lastName}){
    final errorLastName = validator.checkLastName(lastName: lastName);
    state = state.copyWith(
        errorLastName: errorLastName,
        userModel: state.userModel.copyWith(lastName: lastName));
  }

  void firstNameValidator({required String firstName}){
    final errorFirstName = validator.checkFirstName(firstName: firstName);
    state = state.copyWith(
        errorFirstName: errorFirstName,
        userModel: state.userModel.copyWith(firstName: firstName));
  }

  void clearErrText() {
    state = state.copyWith(
        errorLastName: "",errorFirstName: "");
    }

  bool hasNoError() {
    List<String> error = [state.errorLastName,state.errorFirstName];
    return error.every((e) => e == "");
  }

  void copyWithUserModel({
    required String lastName,
    required String firstName,
    required String companyName,
    required String phoneNumber,
    required String fax}) {
    state = state.copyWith(
      userModel: state.userModel.copyWith(
        lastName: lastName,
        firstName: firstName,
        companyName: companyName,
        phoneNumber: phoneNumber,
        fax: fax
      )
    );
  }

}
