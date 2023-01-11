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
}