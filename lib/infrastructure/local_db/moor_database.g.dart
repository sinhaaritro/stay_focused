// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ReportsTable extends DataClass implements Insertable<ReportsTable> {
  final String reviewText;
  final int timeConcentrated;
  final DateTime reportTime;
  ReportsTable(
      {@required this.reviewText,
      @required this.timeConcentrated,
      @required this.reportTime});
  factory ReportsTable.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return ReportsTable(
      reviewText: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}review_text']),
      timeConcentrated: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}time_concentrated']),
      reportTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}report_time']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || reviewText != null) {
      map['review_text'] = Variable<String>(reviewText);
    }
    if (!nullToAbsent || timeConcentrated != null) {
      map['time_concentrated'] = Variable<int>(timeConcentrated);
    }
    if (!nullToAbsent || reportTime != null) {
      map['report_time'] = Variable<DateTime>(reportTime);
    }
    return map;
  }

  ReportsTablesCompanion toCompanion(bool nullToAbsent) {
    return ReportsTablesCompanion(
      reviewText: reviewText == null && nullToAbsent
          ? const Value.absent()
          : Value(reviewText),
      timeConcentrated: timeConcentrated == null && nullToAbsent
          ? const Value.absent()
          : Value(timeConcentrated),
      reportTime: reportTime == null && nullToAbsent
          ? const Value.absent()
          : Value(reportTime),
    );
  }

  factory ReportsTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ReportsTable(
      reviewText: serializer.fromJson<String>(json['reviewText']),
      timeConcentrated: serializer.fromJson<int>(json['timeConcentrated']),
      reportTime: serializer.fromJson<DateTime>(json['reportTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'reviewText': serializer.toJson<String>(reviewText),
      'timeConcentrated': serializer.toJson<int>(timeConcentrated),
      'reportTime': serializer.toJson<DateTime>(reportTime),
    };
  }

  ReportsTable copyWith(
          {String reviewText, int timeConcentrated, DateTime reportTime}) =>
      ReportsTable(
        reviewText: reviewText ?? this.reviewText,
        timeConcentrated: timeConcentrated ?? this.timeConcentrated,
        reportTime: reportTime ?? this.reportTime,
      );
  @override
  String toString() {
    return (StringBuffer('ReportsTable(')
          ..write('reviewText: $reviewText, ')
          ..write('timeConcentrated: $timeConcentrated, ')
          ..write('reportTime: $reportTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(reviewText.hashCode,
      $mrjc(timeConcentrated.hashCode, reportTime.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ReportsTable &&
          other.reviewText == this.reviewText &&
          other.timeConcentrated == this.timeConcentrated &&
          other.reportTime == this.reportTime);
}

class ReportsTablesCompanion extends UpdateCompanion<ReportsTable> {
  final Value<String> reviewText;
  final Value<int> timeConcentrated;
  final Value<DateTime> reportTime;
  const ReportsTablesCompanion({
    this.reviewText = const Value.absent(),
    this.timeConcentrated = const Value.absent(),
    this.reportTime = const Value.absent(),
  });
  ReportsTablesCompanion.insert({
    @required String reviewText,
    this.timeConcentrated = const Value.absent(),
    @required DateTime reportTime,
  })  : reviewText = Value(reviewText),
        reportTime = Value(reportTime);
  static Insertable<ReportsTable> custom({
    Expression<String> reviewText,
    Expression<int> timeConcentrated,
    Expression<DateTime> reportTime,
  }) {
    return RawValuesInsertable({
      if (reviewText != null) 'review_text': reviewText,
      if (timeConcentrated != null) 'time_concentrated': timeConcentrated,
      if (reportTime != null) 'report_time': reportTime,
    });
  }

  ReportsTablesCompanion copyWith(
      {Value<String> reviewText,
      Value<int> timeConcentrated,
      Value<DateTime> reportTime}) {
    return ReportsTablesCompanion(
      reviewText: reviewText ?? this.reviewText,
      timeConcentrated: timeConcentrated ?? this.timeConcentrated,
      reportTime: reportTime ?? this.reportTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (reviewText.present) {
      map['review_text'] = Variable<String>(reviewText.value);
    }
    if (timeConcentrated.present) {
      map['time_concentrated'] = Variable<int>(timeConcentrated.value);
    }
    if (reportTime.present) {
      map['report_time'] = Variable<DateTime>(reportTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReportsTablesCompanion(')
          ..write('reviewText: $reviewText, ')
          ..write('timeConcentrated: $timeConcentrated, ')
          ..write('reportTime: $reportTime')
          ..write(')'))
        .toString();
  }
}

class $ReportsTablesTable extends ReportsTables
    with TableInfo<$ReportsTablesTable, ReportsTable> {
  final GeneratedDatabase _db;
  final String _alias;
  $ReportsTablesTable(this._db, [this._alias]);
  final VerificationMeta _reviewTextMeta = const VerificationMeta('reviewText');
  GeneratedTextColumn _reviewText;
  @override
  GeneratedTextColumn get reviewText => _reviewText ??= _constructReviewText();
  GeneratedTextColumn _constructReviewText() {
    return GeneratedTextColumn('review_text', $tableName, false,
        maxTextLength: 50);
  }

  final VerificationMeta _timeConcentratedMeta =
      const VerificationMeta('timeConcentrated');
  GeneratedIntColumn _timeConcentrated;
  @override
  GeneratedIntColumn get timeConcentrated =>
      _timeConcentrated ??= _constructTimeConcentrated();
  GeneratedIntColumn _constructTimeConcentrated() {
    return GeneratedIntColumn('time_concentrated', $tableName, false,
        defaultValue: const Constant(1));
  }

  final VerificationMeta _reportTimeMeta = const VerificationMeta('reportTime');
  GeneratedDateTimeColumn _reportTime;
  @override
  GeneratedDateTimeColumn get reportTime =>
      _reportTime ??= _constructReportTime();
  GeneratedDateTimeColumn _constructReportTime() {
    return GeneratedDateTimeColumn(
      'report_time',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [reviewText, timeConcentrated, reportTime];
  @override
  $ReportsTablesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'reports_tables';
  @override
  final String actualTableName = 'reports_tables';
  @override
  VerificationContext validateIntegrity(Insertable<ReportsTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('review_text')) {
      context.handle(
          _reviewTextMeta,
          reviewText.isAcceptableOrUnknown(
              data['review_text'], _reviewTextMeta));
    } else if (isInserting) {
      context.missing(_reviewTextMeta);
    }
    if (data.containsKey('time_concentrated')) {
      context.handle(
          _timeConcentratedMeta,
          timeConcentrated.isAcceptableOrUnknown(
              data['time_concentrated'], _timeConcentratedMeta));
    }
    if (data.containsKey('report_time')) {
      context.handle(
          _reportTimeMeta,
          reportTime.isAcceptableOrUnknown(
              data['report_time'], _reportTimeMeta));
    } else if (isInserting) {
      context.missing(_reportTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {reportTime};
  @override
  ReportsTable map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ReportsTable.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ReportsTablesTable createAlias(String alias) {
    return $ReportsTablesTable(_db, alias);
  }
}

class TimerTable extends DataClass implements Insertable<TimerTable> {
  final DateTime reportTime;
  TimerTable({@required this.reportTime});
  factory TimerTable.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return TimerTable(
      reportTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}report_time']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || reportTime != null) {
      map['report_time'] = Variable<DateTime>(reportTime);
    }
    return map;
  }

  TimerTablesCompanion toCompanion(bool nullToAbsent) {
    return TimerTablesCompanion(
      reportTime: reportTime == null && nullToAbsent
          ? const Value.absent()
          : Value(reportTime),
    );
  }

  factory TimerTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TimerTable(
      reportTime: serializer.fromJson<DateTime>(json['reportTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'reportTime': serializer.toJson<DateTime>(reportTime),
    };
  }

  TimerTable copyWith({DateTime reportTime}) => TimerTable(
        reportTime: reportTime ?? this.reportTime,
      );
  @override
  String toString() {
    return (StringBuffer('TimerTable(')
          ..write('reportTime: $reportTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(reportTime.hashCode);
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is TimerTable && other.reportTime == this.reportTime);
}

class TimerTablesCompanion extends UpdateCompanion<TimerTable> {
  final Value<DateTime> reportTime;
  const TimerTablesCompanion({
    this.reportTime = const Value.absent(),
  });
  TimerTablesCompanion.insert({
    @required DateTime reportTime,
  }) : reportTime = Value(reportTime);
  static Insertable<TimerTable> custom({
    Expression<DateTime> reportTime,
  }) {
    return RawValuesInsertable({
      if (reportTime != null) 'report_time': reportTime,
    });
  }

  TimerTablesCompanion copyWith({Value<DateTime> reportTime}) {
    return TimerTablesCompanion(
      reportTime: reportTime ?? this.reportTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (reportTime.present) {
      map['report_time'] = Variable<DateTime>(reportTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimerTablesCompanion(')
          ..write('reportTime: $reportTime')
          ..write(')'))
        .toString();
  }
}

class $TimerTablesTable extends TimerTables
    with TableInfo<$TimerTablesTable, TimerTable> {
  final GeneratedDatabase _db;
  final String _alias;
  $TimerTablesTable(this._db, [this._alias]);
  final VerificationMeta _reportTimeMeta = const VerificationMeta('reportTime');
  GeneratedDateTimeColumn _reportTime;
  @override
  GeneratedDateTimeColumn get reportTime =>
      _reportTime ??= _constructReportTime();
  GeneratedDateTimeColumn _constructReportTime() {
    return GeneratedDateTimeColumn(
      'report_time',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [reportTime];
  @override
  $TimerTablesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'timer_tables';
  @override
  final String actualTableName = 'timer_tables';
  @override
  VerificationContext validateIntegrity(Insertable<TimerTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('report_time')) {
      context.handle(
          _reportTimeMeta,
          reportTime.isAcceptableOrUnknown(
              data['report_time'], _reportTimeMeta));
    } else if (isInserting) {
      context.missing(_reportTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {reportTime};
  @override
  TimerTable map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return TimerTable.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TimerTablesTable createAlias(String alias) {
    return $TimerTablesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ReportsTablesTable _reportsTables;
  $ReportsTablesTable get reportsTables =>
      _reportsTables ??= $ReportsTablesTable(this);
  $TimerTablesTable _timerTables;
  $TimerTablesTable get timerTables => _timerTables ??= $TimerTablesTable(this);
  ReportsDao _reportsDao;
  ReportsDao get reportsDao => _reportsDao ??= ReportsDao(this as AppDatabase);
  TimerDao _timerDao;
  TimerDao get timerDao => _timerDao ??= TimerDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [reportsTables, timerTables];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$ReportsDaoMixin on DatabaseAccessor<AppDatabase> {
  $ReportsTablesTable get reportsTables => attachedDatabase.reportsTables;
}
mixin _$TimerDaoMixin on DatabaseAccessor<AppDatabase> {
  $TimerTablesTable get timerTables => attachedDatabase.timerTables;
}
