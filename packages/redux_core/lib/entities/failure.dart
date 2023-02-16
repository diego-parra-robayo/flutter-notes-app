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

  Failure copyWith({
    String? message,
    FailureType? type,
  }) {
    return Failure(
      message: message ?? this.message,
      type: type ?? this.type,
    );
  }
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({
    String? message,
    super.type,
  }) : super(message: message ?? 'Element was not found');
}
