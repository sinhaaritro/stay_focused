import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:stay_focused/domain/timer_model.dart';
import '../../infrastructure/timer_repository/timer_repository.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final TimerRepository timerRepository;

  TimerBloc(this.timerRepository) : super(TimerStateLoading());

  @override
  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    if (event is GetTimerEvent) {
      yield* _mapGetTimersToState(event);
    } else if (event is AddTimerEvent) {
      yield* _mapAddTimersToState(event);
    } else if (event is DeleteTimerEvent) {
      yield* _mapDeleteTimersToState(event);
    }
  }

  Stream<TimerState> _mapGetTimersToState(GetTimerEvent event) async* {
    try {
      yield TimerStateLoading();

      final List<TimerModel> timerList = await timerRepository.getTimers();
      if (timerList.isEmpty) {
        yield TimerStateEmpty();
      } else {
        yield TimerStateLoaded(timerList);
      }
    } catch (_) {
      yield TimerStateError("Problem with fetch data");
    }
  }

  Stream<TimerState> _mapAddTimersToState(AddTimerEvent event) async* {
    try {
      List<TimerModel> timerList = await timerRepository.getTimers();

      //Validating
      for (final timer in timerList) {
        if (event.addTimer.startTime.isAtSameMomentAs(timer.startTime)) {
          //Same Hour and Minute
          yield TimerStateError("Timer with same value cant be added again");
          break;
        } else if (event.addTimer.startTime.isAfter(timer.startTime) &&
                event.addTimer.startTime.isBefore(timer.endTime) ||
            event.addTimer.endTime.isAfter(timer.startTime) &&
                event.addTimer.endTime.isBefore(timer.endTime)) {
          //Within 1hr
          yield TimerStateError(
              "Cant have two timers within 1 hour of each other");
          break;
        } else {
          timerRepository.addTimers(event.addTimer);
        }
      }

      yield TimerStateLoading();

      timerList = await timerRepository.getTimers();
      if (timerList.isEmpty) {
        yield TimerStateEmpty();
      } else {
        yield TimerStateLoaded(timerList);
      }
    } catch (_) {
      yield TimerStateError("Problem with adding data");
    }
  }

  Stream<TimerState> _mapDeleteTimersToState(DeleteTimerEvent event) async* {
    try {
      timerRepository.deleteTimers(event.deleteTimer);

      yield TimerStateLoading();
      final List<TimerModel> timerList = await timerRepository.getTimers();

      if (timerList.isEmpty) {
        yield TimerStateEmpty();
      } else {
        yield TimerStateLoaded(timerList);
      }
    } catch (_) {
      yield TimerStateError("Problem with deleting data");
    }
  }
}
