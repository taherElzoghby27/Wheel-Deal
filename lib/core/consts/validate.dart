bool isEmailValid(String? email) {
  if (email == null || email.isEmpty) {
    return false;
  }

  RegExp pattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return pattern.hasMatch(email);
}

bool isPasswordValid(String? password) {
  if (password == null || password.isEmpty) {
    return false;
  }

  RegExp pattern = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$');
  return pattern.hasMatch(password);
}