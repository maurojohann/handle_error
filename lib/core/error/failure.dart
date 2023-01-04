import 'dart:developer';

abstract class Failure {
  final dynamic errorMessage;

  Failure({
    required String label,
    required this.errorMessage,
  }) {
    log('$label: ${errorMessage.toString()}');
  }

  @override
  String toString() {
    return errorMessage.toString();
  }
}

class UnknownError extends Failure {
  UnknownError({
    required String label,
    required dynamic message,
  }) : super(errorMessage: message, label: label);
}
