bool checkEmailValidation(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool checkPasswordValidation(String password) {
  return RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$')
      .hasMatch(password);
}

bool checkNumbervalidation(String numb) {
  return RegExp(r'(^(?:[+0]9)?[0-9]{10}$)').hasMatch(numb);
}

bool checkStdvalidation(String numb) {
  return RegExp(r'\d{5}([- ]*)\d{6}$)').hasMatch(numb);
}

bool checkNamevalidation(String name) {
  return RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
      .hasMatch(name);
}

bool checkAdhaarvalidation(String num) {
  return RegExp(r'^[0-9]{4}[ -]?[0-9]{4}[ -]?[0-9]{4}$').hasMatch(num);
}
