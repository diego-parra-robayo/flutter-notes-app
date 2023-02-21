import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:core/l10n/core_localizations_extensions.dart';

class Failure extends Equatable {
  final String Function(BuildContext context) getMessage;

  const Failure({
    required this.getMessage,
  });

  @override
  List<Object?> get props => [getMessage];
}

class UnauthenticatedFailure extends Failure {
  UnauthenticatedFailure({
    String Function(BuildContext context)? getMessage,
  }) : super(
          getMessage: getMessage ??
              (context) => context.l10n.notAuthenticatedFailureMessage,
        );
}

class NotFoundFailure extends Failure {
  NotFoundFailure({
    String Function(BuildContext context)? getMessage,
  }) : super(
          getMessage:
              getMessage ?? (context) => context.l10n.notFoundFailureMessage,
        );
}
