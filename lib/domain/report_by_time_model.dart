import 'package:flutter/material.dart';

import 'timer_model.dart';

class ReportByTimeModel {
  final TimerModel reportTime;
  final int totalTimeConcentrated;
  final String timeReview;

  ReportByTimeModel({
    @required this.reportTime,
    @required this.totalTimeConcentrated,
    @required this.timeReview,
  });
}
