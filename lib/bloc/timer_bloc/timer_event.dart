part of 'timer_bloc.dart';

@immutable
abstract class TimerEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetTimerEvent extends TimerEvent {}

class AddTimerEvent extends TimerEvent {
  final TimerModel addTimer;

  AddTimerEvent(this.addTimer);
}

class DeleteTimerEvent extends TimerEvent {
  final TimerModel deleteTimer;

  DeleteTimerEvent(this.deleteTimer);
}
