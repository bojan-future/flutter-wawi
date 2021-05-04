part of 'database.dart';

/// general database Exception
class DatabaseException implements Exception {}

/// thrown when requested record could not be found in the database
class RecordNotFoundException extends DatabaseException {}
