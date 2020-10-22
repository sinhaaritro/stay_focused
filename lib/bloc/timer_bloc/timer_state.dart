part of 'timer_bloc.dart';

@immutable
abstract class TimerState extends Equatable {
  @override
  List<Object> get props => [];
}

class TimerStateLoading extends TimerState {}

class TimerStateLoaded extends TimerState {
  final List<TimerModel> allTimerList;

  TimerStateLoaded(this.allTimerList);
}

class TimerStateEmpty extends TimerState {}

class TimerStateError extends TimerState {
  final String timerError;

  TimerStateError(this.timerError);
}
