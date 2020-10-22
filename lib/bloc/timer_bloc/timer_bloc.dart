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
      print(timerList.length);
      if (timerList.isEmpty) {
        yield TimerStateEmpty();
      } else {
        yield TimerStateLoaded(timerList);
      }
    } catch (_) {
      yield TimerStateError();
    }
  }

  Stream<TimerState> _mapAddTimersToState(AddTimerEvent event) async* {
    try {
      timerRepository.addTimers(event.addTimer);

      yield TimerStateLoading();

      final List<TimerModel> timerList = await timerRepository.getTimers();
      if (timerList.isEmpty) {
        yield TimerStateEmpty();
      } else {
        yield TimerStateLoaded(timerList);
      }
    } catch (_) {
      yield TimerStateError();
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
      yield TimerStateError();
    }
  }
}
