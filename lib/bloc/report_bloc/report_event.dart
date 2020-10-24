part of 'report_bloc.dart';

@immutable
abstract class ReportEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetReportEvent extends ReportEvent {}

class AddReportEvent extends ReportEvent {
  final ReportByTimeModel addReport;

  AddReportEvent(this.addReport);
}

class UpdateReportEvent extends ReportEvent {
  final ReportByTimeModel updateOldReport;
  final ReportByTimeModel updateNewReport;

  UpdateReportEvent({this.updateOldReport, this.updateNewReport});
}

class DeleteReportEvent extends ReportEvent {
  final ReportByTimeModel deleteReport;

  DeleteReportEvent(this.deleteReport);
}
