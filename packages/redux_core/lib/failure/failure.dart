import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;

  const Failure({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}

class UnauthenticatedFailure extends Failure {
  const UnauthenticatedFailure({
    String? message,
  }) : super(
          message: message ?? 'Please sign in to access this feature.',
        );
}

class NotFoundFailure extends Failure {
  const NotFoundFailure({
    String? message,
  }) : super(message: message ?? 'Element was not found');
}
