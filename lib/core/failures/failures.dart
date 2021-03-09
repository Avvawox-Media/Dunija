abstract class Failure {}

class DatabaseFailure {
  final String failure;
  final String details;

  DatabaseFailure(this.failure, this.details);
}
