import 'package:get/get.dart';

DateTime now = DateTime.now();

greetings(String greeting) {
  DateTime greeting = DateTime.now();
  ;
  if (greeting.isBefore(desiredTime(hour: 11, minutes: 59)) ||
      greeting.isAtSameMomentAs(desiredTime(hour: 11, minutes: 59))) {
    return 'Morning';
  } else if (greeting.isAfter(desiredTime(hour: 11, minutes: 59)) ||
             greeting.isBefore(desiredTime(hour: 16, minutes: 59)) ||
             greeting.isAtSameMomentAs(desiredTime(hour: 16, minutes: 59))) {
    return 'Afternoon';
  } else if (greeting.isAfter(desiredTime(hour: 16, minutes: 59)) ||
             greeting.isBefore(desiredTime(hour: 23, minutes: 59)) ||
             greeting.isAtSameMomentAs(desiredTime(hour: 23, minutes: 59))) {
    return 'evening';
  } else {
    return 'Morning';
  }
}

DateTime desiredTime({int hour = 1, int minutes = 1}) {
  return DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day,
      hour, minutes , DateTime.now().second,DateTime.now().millisecond , DateTime.now().microsecond);
}
