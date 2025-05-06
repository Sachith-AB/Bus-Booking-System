class CrudFailure implements Exception {
  final String message;

  CrudFailure([this.message = "An Unknown error occurred"]);

  factory CrudFailure.code(String code) {
    switch (code) {
      case "cancelled":
        return CrudFailure("The operation was canceled");

      case "unknown":
        return CrudFailure("Unknown error occurred");

      case "invalid-argument":
        return CrudFailure("Client specified an invalid argument");

      case "deadline-exceeded":
        return CrudFailure("Deadline expired before operation could complete");

      case "not-found":
        return CrudFailure("Some requested document was not found");

      case "already-exists":
        return CrudFailure(
            "Some document that we attempted to create already exists");

      case "permission-denied":
        return CrudFailure(
            "The caller does not have permission to execute the specified operation");

      case "unauthenticated":
        return CrudFailure(
            "The request does not have valid authentication credentials for the operation");

      case "resource-exhausted":
        return CrudFailure("Some resource has been exhausted");

      case "failed-precondition":
        return CrudFailure(
            "Operation was rejected because the system is not in a state required for the operation's execution");

      case "aborted":
        return CrudFailure(
            "The operation was aborted, typically due to a concurrency issue like transaction aborts");

      case "out-of-range":
        return CrudFailure("Operation was attempted past the valid range");

      case "unimplemented":
        return CrudFailure("Operation is not implemented or not supported");

      case "internal":
        return CrudFailure(
            "Internal errors. Something is wrong with the Firestore servers");

      case "unavailable":
        return CrudFailure("The service is currently unavailable");

      case "data-loss":
        return CrudFailure("Unrecoverable data loss or corruption");
      case "user-disabled":
        return CrudFailure(
            "This user has been disabled. Please contact support for help");
      default:
        return CrudFailure();
    }
  }
}