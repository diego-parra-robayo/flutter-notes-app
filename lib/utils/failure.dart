abstract class Failure {
  final String message;
  Failure(this.message);
}

class ApiFailure extends Failure {
  ApiFailure(super.message);
}

class NotFound extends Failure {
  NotFound({String? message}) : super(message ?? 'Item not found');
}
