import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pattohou/models/local/model/sign_up_model.dart';
import 'package:pattohou/models/repository/api/postal_code.dart';
import 'package:pattohou/models/repository/database/user_repository.dart';
import 'package:pattohou/models/repository/model/user_model.dart';
import 'package:pattohou/viewmodel/common/validator.dart';

final signUpProvider =
    StateNotifierProvider.autoDispose<SignUpNotifier, SignUp>((ref) {
  return SignUpNotifier(ref.read);
});

class SignUpNotifier extends StateNotifier<SignUp> {
  final Reader _read;

  SignUpNotifier(this._read)
      : super(SignUp(
            errorLastName: "",
            errorFirstName: "",
            errorPostalCode: "",
            userModel: UserModel.empty()));
  final validator = Validator();

  void lastNameValidator({required String lastName}) {
    final errorLastName = validator.checkLastName(lastName: lastName);
    state = state.copyWith(
      errorLastName: errorLastName,
    );
  }

  void firstNameValidator({required String firstName}) {
    final errorFirstName = validator.checkFirstName(firstName: firstName);
    state = state.copyWith(errorFirstName: errorFirstName);
  }

  void clearErrText() {
    state = state.copyWith(errorLastName: "", errorFirstName: "");
  }

  bool hasError() {
    List<String> error = [state.errorLastName, state.errorFirstName];
    return !error.every((e) => e == "");
  }

  void copyWithUserModel(
      {required String lastName,
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
            fax: fax));
  }

  void chkPostalCode({required String postalCode}) {
    final errorPostalCode = validator.checkPostalCode(postalCode: postalCode);
    state = state.copyWith(errorPostalCode: errorPostalCode);
  }

  Future<List<String>?> searchAddress({required String postalCode}) async {
    chkPostalCode(postalCode: postalCode);
    if (state.errorPostalCode.isNotEmpty) {
      return null;
    }
    Map<String, dynamic>? list =
        await _read(postalCodeProvider).fetchAddress(postalCode: postalCode);
    if (list == null) {
      state = state.copyWith(errorPostalCode: '通信エラー');
      return null;
    }
    if (list['results'] == null) {
      state = state.copyWith(errorPostalCode: '存在しない郵便番号です');
      return null;
    }
    return [
      list['results'][0]['address1'].toString(),
      list['results'][0]['address2'].toString(),
      list['results'][0]['address3'].toString()
    ];
  }

  void copyWithAddress(
      {required String postalCode,
      required String prefecture,
      required String cityName,
      required String cityBlock,
      required String apartment}) {
    state = state.copyWith(
        userModel: state.userModel.copyWith(
            address: state.userModel.address.copyWith(
              postalCode: postalCode,
              prefecture: prefecture,
              cityName: cityName,
              cityBlock: cityBlock,
              apartment: apartment
            ))
    );
  }

  createUser() async{
    await _read(userRepoProvider).createUser(state.userModel);
  }
}
