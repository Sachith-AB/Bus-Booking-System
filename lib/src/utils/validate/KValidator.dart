class KValidator {
  static final _nameRegex = RegExp(r'^[a-zA-Z]+(?:\s[a-zA-Z]+)*$');
  static final _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  static String? validateName(String uName) {
    final name = uName.trim();
    if (name.isEmpty) {
      return "* Name is required.";
    } else if (!_nameRegex.hasMatch(name) || name.length < 3) {
      return "* Name is invalid.";
    }
    return null; // valid
  }

  static bool validateEmail(String email) {
    return _emailRegex.hasMatch(email.trim());
  }

  static String? validatePassword(String password,String cPassword){
    if(password.isEmpty){
      return "* Password is Required";
    }else if(password.length < 8){
      return "* Password must be 8 Character";
    }else if(cPassword.isEmpty){
      return "* Confirm Password is Required";
    }else if(password != cPassword){
      return "* Password Must Match";
    }
    return null;
  }

  static validateLoginPassword(String password) {
    if (password.isEmpty) {
      return "* Password is Required";
    }else if(password.length<8){
      return "* Password Invalid";
    }
    return null;
  }
}
