abstract class Failure {
  final String message;
  Failure({
    required this.message,
  });
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});
}

class LocalDataBaseFailure extends Failure {
  LocalDataBaseFailure({required super.message});
}
