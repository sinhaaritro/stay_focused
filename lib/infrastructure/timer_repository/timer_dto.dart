import 'package:stay_focused/domain/timer_model.dart';
import '../local_db/moor_database.dart';

class TimerDto {
  static TimerModel asDomain(TimerTable timerFromMoor) {
    return TimerModel(timerFromMoor.reportTime);
  }

  static TimerTable fromDomain(TimerModel timerToDomain) {
    return TimerTable(reportTime: timerToDomain.startTime);
  }
}
