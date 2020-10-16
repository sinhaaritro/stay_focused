import 'dart:io';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:sqflite/sqflite.dart' show getDatabasesPath;
import 'package:path/path.dart' as p;

part 'moor_database.g.dart';

@DataClassName('ReportsTable')
class ReportsTables extends Table {
  TextColumn get reviewText => text().withLength(max: 50)();
  IntColumn get timeConcentrated => integer().withDefault(const Constant(1))();
  DateTimeColumn get reportTime => dateTime()();

  @override
  Set<Column> get primaryKey => {reportTime};
}

@DataClassName('TimerTable')
class TimerTables extends Table {
  DateTimeColumn get reportTime => dateTime()();

  @override
  Set<Column> get primaryKey => {reportTime};
}

@UseMoor(tables: [ReportsTables, TimerTables], daos: [ReportsDao, TimerDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(
          LazyDatabase(() async {
            final dbFolder = await getDatabasesPath();
            final file = File(p.join(dbFolder, 'db.sqlite'));
            return VmDatabase(file);
          }),
        );

  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [ReportsTables])
class ReportsDao extends DatabaseAccessor<AppDatabase> with _$ReportsDaoMixin {
  final AppDatabase db;

  ReportsDao(this.db) : super(db);

  Future<List<ReportsTable>> getAllReports() => select(reportsTables).get();
  Future insertReport(Insertable<ReportsTable> reportTable) =>
      into(reportsTables).insert(reportTable);
  Future updateReport(Insertable<ReportsTable> reportTable) =>
      update(reportsTables).replace(reportTable);
  Future deleteReport(Insertable<ReportsTable> reportTable) =>
      delete(reportsTables).delete(reportTable);
}

@UseDao(tables: [TimerTables])
class TimerDao extends DatabaseAccessor<AppDatabase> with _$TimerDaoMixin {
  final AppDatabase db;

  TimerDao(this.db) : super(db);

  Future<List<TimerTable>> getAllTimers() => select(timerTables).get();
  Future insertTimers(Insertable<TimerTable> timerTable) =>
      into(timerTables).insert(timerTable);
  Future updateTimers(Insertable<TimerTable> timerTable) =>
      update(timerTables).replace(timerTable);
  Future deleteTimers(Insertable<TimerTable> timerTable) =>
      delete(timerTables).delete(timerTable);
}
