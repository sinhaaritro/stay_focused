import 'package:flutter/material.dart';
import 'report_by_time_model.dart';

class ReportByDateModel {
  DateTime reportDate;
  int totalTimeConcentrated;
  final List<ReportByTimeModel> reportList;

  ReportByDateModel({@required this.reportList}) {
    _getTotalTimeConcentrated();
    _getReportDate();
  }

  void _getTotalTimeConcentrated() {
    for (final report in reportList) {
      totalTimeConcentrated =
          totalTimeConcentrated + report.totalTimeConcentrated;
    }
    totalTimeConcentrated = totalTimeConcentrated / reportList.length as int;
  }

  void _getReportDate() {
    reportDate = reportList.first.reportTime.startTime;
  }
}
