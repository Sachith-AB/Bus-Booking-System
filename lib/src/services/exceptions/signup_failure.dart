class SignUpFailure implements Exception {

  final String message;

  SignUpFailure([this.message = "An Unknown error occurred"]);

  factory SignUpFailure.code(String code) {
    switch (code) {
      case "weak-password":
        return SignUpFailure("Please Enter a stronger password.");
      case "invalid-email":
        return SignUpFailure("Email is not valid. Try again.");
      case "email-already-in-use":
        return SignUpFailure(
            "The email address is already in use by another account.");
      case "operation-not-allowed":
        return SignUpFailure("Operations not allowed. Please contact support.");
      case "user-disabled":
        return SignUpFailure(
            "This user has been disabled. Please contact support for help.");
      default:
        return SignUpFailure();
    }
  }
}