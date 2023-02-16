import 'package:equatable/equatable.dart';

enum FailureType { breakingMessage, popUpMessage }

class Failure extends Equatable {
  final String message;
  final FailureType type;

  const Failure({
    required this.message,
    this.type = FailureType.popUpMessage,
  });

  @override
  List<Object?> get props => [message, type];
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({
    String? message,
    super.type,
  }) : super(message: message ?? 'Element was not found');
}
