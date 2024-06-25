class SignInSecurityEntity {
  final String email;
  final String code;
  final String token;
  final String password;
  final String newPassword;
  final String confirmNewPassword;

  SignInSecurityEntity({
    required this.email,
    required this.code,
    required this.token,
    required this.password,
    required this.newPassword,
    required this.confirmNewPassword,
  });

  toMapCodeInput() {
    return {
      'email': email,
      'verification_code': code,
    };
  }

  toMapUpdateEmail() {
    return {
      'email': email,
      'password': password,
    };
  }

  toMapUpdatePassword() {
    return {
      'password': password,
      'new_password': newPassword,
      'confirm_new_password': confirmNewPassword,
    };
  }
}
