import '../../domain/timer_model.dart';
import '../local_db/moor_database.dart';
import 'timer_dto.dart';

class TimerRepository {
  final TimerDao timerDao;

  TimerRepository(this.timerDao);

  Future<List<TimerModel>> getTimers() async {
    final List<TimerTable> timersListFromMoor = await timerDao.getAllTimers();
    final List<TimerModel> timersListToModel = [];
    for (final timer in timersListFromMoor) {
      timersListToModel.add(TimerDto.asDomain(timer));
    }
    return timersListToModel;
  }

  void addTimers(TimerModel timer) {
    final TimerTable addTimer = TimerDto.fromDomain(timer);
    timerDao.insertTimers(addTimer);
  }

  void deleteTimers(TimerModel timer) {
    final TimerTable deleteTimer = TimerDto.fromDomain(timer);
    timerDao.deleteTimers(deleteTimer);
  }
}
