import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../domain/report_by_date_model.dart';
import '../../domain/report_by_time_model.dart';
import './../../infrastructure/report_repository/report_repository.dart';

part 'report_event.dart';
part 'report_state.dart';

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final ReportRepository reportRepository;

  ReportBloc(this.reportRepository) : super(ReportStateLoading());

  @override
  Stream<ReportState> mapEventToState(ReportEvent event) async* {
    if (event is GetReportEvent) {
      yield* _mapGetReportToState(event);
    } else if (event is AddReportEvent) {
      yield* _mapAddReportToState(event);
    } else if (event is UpdateReportEvent) {
      yield* _mapUpdateReportToState(event);
    } else if (event is DeleteReportEvent) {
      yield* _mapDeleteRepotToState(event);
    }
  }

  Stream<ReportState> _mapGetReportToState(GetReportEvent event) async* {
    try {
      yield ReportStateLoading();
      final List<ReportByTimeModel> reportList =
          await reportRepository.getReports();
      if (reportList.isEmpty) {
        yield ReportStateEmpty();
      } else {
        yield ReportStateLoaded(reportList);
      }
    } catch (_) {
      yield ReportStateError("Problem with fetching data");
    }
  }

  Stream<ReportState> _mapAddReportToState(AddReportEvent event) async* {
    try {
      reportRepository.addReports(event.addReport);
      yield ReportStateLoading();
      final List<ReportByTimeModel> reportList =
          await reportRepository.getReports();
      if (reportList.isEmpty) {
        yield ReportStateEmpty();
      } else {
        yield ReportStateLoaded(reportList);
      }
    } catch (_) {
      yield ReportStateError("Problem with adding data");
    }
  }

  Stream<ReportState> _mapUpdateReportToState(UpdateReportEvent event) async* {}

  Stream<ReportState> _mapDeleteRepotToState(DeleteReportEvent event) async* {
    try {
      reportRepository.deleteReports(event.deleteReport);
      yield ReportStateLoading();
      final List<ReportByTimeModel> reportList =
          await reportRepository.getReports();
      if (reportList.isEmpty) {
        yield ReportStateEmpty();
      } else {
        yield ReportStateLoaded(reportList);
      }
    } catch (_) {
      yield ReportStateError("Problem with adding data");
    }
  }
}
