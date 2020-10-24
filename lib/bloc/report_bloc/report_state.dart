part of 'report_bloc.dart';

abstract class ReportState extends Equatable {
  @override
  List<Object> get props => [];
}

class ReportStateLoading extends ReportState {}

class ReportStateLoaded extends ReportState {
  final List<ReportByTimeModel> reportByDateList;

  ReportStateLoaded(this.reportByDateList);
}

class ReportStateEmpty extends ReportState {}

class ReportStateError extends ReportState {
  final String timerError;

  ReportStateError(this.timerError);
}
