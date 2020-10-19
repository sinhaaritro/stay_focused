part of 'local_db_bloc.dart';

// @immutable
class LocalDatabaseState extends Equatable {
  final AppDatabase localDatabase = AppDatabase();

  @override
  List<Object> get props => [localDatabase];
}
