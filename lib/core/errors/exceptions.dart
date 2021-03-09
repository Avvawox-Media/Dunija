class DatabaseException implements Exception {
  final String error;
  final String details;

  DatabaseException({this.error, this.details});
}
