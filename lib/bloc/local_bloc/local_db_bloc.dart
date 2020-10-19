import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../infrastructure/local_db/moor_database.dart';

part 'local_db_event.dart';
part 'local_db_state.dart';

class LocalDatabaseBloc extends Bloc<LocalDatabaseEvent, LocalDatabaseState> {
  LocalDatabaseBloc() : super(LocalDatabaseState());

  @override
  Stream<LocalDatabaseState> mapEventToState(LocalDatabaseEvent event) async* {
    if (event is LocalDatabaseInitialize) {
      yield LocalDatabaseState();
    }
  }
}
