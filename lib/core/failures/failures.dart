import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class DatabaseFailure extends Failure {
  final String failure;
  final String details;

  DatabaseFailure(this.failure, this.details);

  @override
  // TODO: implement props
  List<Object> get props => [failure, details];
}
