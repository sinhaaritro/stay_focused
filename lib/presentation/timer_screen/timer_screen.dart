import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../bloc/timer_bloc/timer_bloc.dart';
import '../../domain/timer_model.dart';

class TimerScreen extends StatelessWidget {
  final List<TimerModel> upComingTimerList = [];
  @override
  Widget build(BuildContext context) {
    context.bloc<TimerBloc>().add(GetTimerEvent());
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
          BlocBuilder<TimerBloc, TimerState>(
            builder: (context, state) {
              if (state is TimerStateLoading) {
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state is TimerStateError) {
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text("Timer Error",
                        style: Theme.of(context).textTheme.headline6),
                  ),
                );
              } else if (state is TimerStateEmpty) {
                return Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text("No Timer's\nAdd Timers to View Here",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6),
                  ),
                );
              } else if (state is TimerStateLoaded) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: state.upComingTimerList
                      .map(
                        (upComingTimer) => Flexible(
                          child:
                              UpcomingTimerCard(upComingTimer: upComingTimer),
                        ),
                      )
                      .toList(),
                );
              } else {
                return Container();
              }
            },
          ),
          ElevatedButton(
            onPressed: () async {
              final TimeOfDay pickededTime = await _pickDate(context);
              final DateTime pseudoDateAdded =
                  DateTime(2020, 1, 31, pickededTime.hour, pickededTime.minute);
              final addNewTimer = context.bloc<TimerBloc>();
              addNewTimer.add(AddTimerEvent(TimerModel(pseudoDateAdded)));
            },
            child: const Text("Add New Timer"),
          ),
        ],
      ),
    );
  }

  Future<TimeOfDay> _pickDate(context) async {
    final TimeOfDay selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    return selectedTime;
  }
}

class UpcomingTimerCard extends StatelessWidget {
  final TimerModel upComingTimer;

  const UpcomingTimerCard({Key key, this.upComingTimer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String startTime = DateFormat.jm().format(upComingTimer.startTime);
    final String endTime = DateFormat.jm().format(upComingTimer.endTime);

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
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    final deleteTimer = context.bloc<TimerBloc>();
                    deleteTimer.add(DeleteTimerEvent(upComingTimer));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
