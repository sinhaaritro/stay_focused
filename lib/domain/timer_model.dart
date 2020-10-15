class TimerModel {
  final DateTime startTime;
  DateTime endTime;

  TimerModel(this.startTime) {
    _getEndTimer();
  }

  void _getEndTimer() {
    endTime = startTime.add(const Duration(hours: 1));
  }
}
