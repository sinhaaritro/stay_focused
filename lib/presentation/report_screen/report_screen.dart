import 'package:flutter/material.dart';
import '../../domain/report_by_time_model.dart';
import '../../domain/report_by_date_model.dart';

class ReportsScreen extends StatelessWidget {
  final List<ReportByDateModel> reportDateList = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: reportDateList.length,
        itemBuilder: (context, index) {
          return ReportDateWidget(
            reportDateModel: reportDateList[index],
          );
        },
      ),
    );
  }
}

class ReportDateWidget extends StatelessWidget {
  final ReportByDateModel reportDateModel;

  const ReportDateWidget({Key key, this.reportDateModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String date = reportDateModel.reportDate.toString();

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(date, style: Theme.of(context).textTheme.headline6),
                Text(reportDateModel.totalTimeConcentrated.toString(),
                    style: Theme.of(context).textTheme.headline6),
              ],
            ),
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: reportDateModel.reportList
                  .map(
                    (reportTime) => ReportTimeWidget(
                      reportTime: reportTime,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class ReportTimeWidget extends StatelessWidget {
  final ReportByTimeModel reportTime;

  const ReportTimeWidget({Key key, this.reportTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String startTime = reportTime.reportTime.startTime as String;
    final String endTime = reportTime.reportTime.endTime as String;

    return ExpansionTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$startTime - $endTime"),
          Text("${reportTime.totalTimeConcentrated}%"),
        ],
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(reportTime.timeReview),
        ),
      ],
    );
  }
}
