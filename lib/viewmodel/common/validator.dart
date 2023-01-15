import 'package:email_validator/email_validator.dart';

class Validator {

  String checkEmail({required String email}) {
    if(email == "") return "メールアドレスを入力してください";
    if (!EmailValidator.validate(email)) return "不正な形式のメールアドレスです";
    return "";
  }

  String checkPassword({required String password}) {
    if (password == "") return "パスワードを入力してください";
    if (password.length < 6) return "パスワードは６文字以上です";
    if (20 < password.length) return "パスワードは２０文字以内です";
    return "";
  }
  String checkLastName({required String lastName}){
    if (lastName.isEmpty) return '＊姓を入力してください';
    return '';
  }

  String checkFirstName({required String firstName}){
    if (firstName.isEmpty) return '＊名を入力してください';
    return '';
  }

  String checkPostalCode({required String postalCode}){
    if (postalCode.isEmpty) return '＊郵便番号を入力してください';
    if (postalCode.length != 7) return '＊郵便番号は7桁で入力してください';
    if (!RegExp(r'^[0-9]+$').hasMatch(postalCode)) return '＊数字を入力してください';
    return '';
  }

  checkName({required String name}) {
    if (name.isEmpty) return '＊物件名を入力してください';
    return '';
  }
}