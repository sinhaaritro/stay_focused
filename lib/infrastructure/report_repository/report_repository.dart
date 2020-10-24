import '../../domain/report_by_time_model.dart';
import '../../infrastructure/local_db/moor_database.dart';
import '../../infrastructure/report_repository/report_dto.dart';

class ReportRepository {
  final ReportsDao reportsDao;

  ReportRepository(this.reportsDao);

  Future<List<ReportByTimeModel>> getReports() async {
    final List<ReportsTable> reportListFromMoor =
        await reportsDao.getAllReports();
    final List<ReportByTimeModel> reportListFromModel = [];
    for (final report in reportListFromMoor) {
      reportListFromModel.add(ReportDto.asDomain(report));
    }
    return reportListFromModel;
  }

  void addReports(ReportByTimeModel report) {
    final ReportsTable addReport = ReportDto.fromDomain(report);
    reportsDao.insertReport(addReport);
  }

  void updateReports(ReportByTimeModel report) {
    final ReportsTable addReport = ReportDto.fromDomain(report);
    reportsDao.updateReport(addReport);
  }

  void deleteReports(ReportByTimeModel report) {
    final ReportsTable addReport = ReportDto.fromDomain(report);
    reportsDao.deleteReport(addReport);
  }
}
