class SignInSecurityEntity {
  final String? email;
  final String? code;
  final String? token;
  final String? password;
  final String? newPassword;
  final String? confirmNewPassword;

  SignInSecurityEntity({
    this.email,
    this.code,
    this.token,
    this.password,
    this.newPassword,
    this.confirmNewPassword,
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

  factory SignInSecurityEntity.fromMap(Map<String, dynamic> data){
    return SignInSecurityEntity();
  }
}
