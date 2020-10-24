import '../../domain/report_by_time_model.dart';
import '../local_db/moor_database.dart';

class ReportDto {
  static ReportByTimeModel asDomain(ReportsTable reportFromMoor) {
    return ReportByTimeModel(
      reportTime: reportFromMoor.reportTime,
      timeReview: reportFromMoor.reviewText,
      totalTimeConcentrated: reportFromMoor.timeConcentrated,
    );
  }

  static ReportsTable fromDomain(ReportByTimeModel reportToDomain) {
    return ReportsTable(
      reportTime: reportToDomain.reportTime,
      reviewText: reportToDomain.timeReview,
      timeConcentrated: reportToDomain.totalTimeConcentrated,
    );
  }
}
