class Failure {
  final String message;
  final int? statusCode;
  final Exception? exception;
  final StackTrace? stackTrace;

  Failure({
    required this.message,
    this.statusCode,
    this.exception,
    this.stackTrace,
  });
}
