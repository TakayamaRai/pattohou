
class SignIn{
  const SignIn({required this.email, required this.errorEmail, required this.password, required this.errorPassword});

  final String email;
  final String errorEmail;
  final String password;
  final String errorPassword;

  SignIn copyWith({String? email, String? errorEmail, String? password, String? errorPassword}){
    return SignIn(
        email: email ?? this.email,
        errorEmail: errorEmail ?? this.errorEmail,
        password: password ?? this.password,
        errorPassword: errorPassword ?? this.errorPassword);
  }
}