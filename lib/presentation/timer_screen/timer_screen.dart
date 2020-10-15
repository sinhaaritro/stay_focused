import 'package:flutter/material.dart';
import '../../domain/timer_model.dart';

class TimerScreen extends StatelessWidget {
  final List<TimerModel> upComingTimerList = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * 3 / 4,
            width: MediaQuery.of(context).size.width,
            child: Card(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text("Upcoming Timers of the Day",
              style: Theme.of(context).textTheme.headline5),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: upComingTimerList
                .map(
                  (upComingTimer) => Flexible(
                    child: UpcomingTimerCard(upComingTimer: upComingTimer),
                  ),
                )
                .toList(),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Add New Timer"),
          ),
        ],
      ),
    );
  }
}

class UpcomingTimerCard extends StatelessWidget {
  final TimerModel upComingTimer;

  const UpcomingTimerCard({Key key, this.upComingTimer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String startTime = upComingTimer.startTime as String;
    final String endTime = upComingTimer.endTime as String;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$startTime - $endTime",
                    style: Theme.of(context).textTheme.headline6),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
