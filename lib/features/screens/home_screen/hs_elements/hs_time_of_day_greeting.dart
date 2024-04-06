import 'package:intl/intl.dart';

String timeOfDayGreeting({required DateTime inputDate}) {
  int time = int.parse(DateFormat('HH').format(inputDate));
  if (time > 5 && time < 12) {
    return 'Good morning!';
  } else if (time > 11 && time < 19) {
    return 'Good afternoon!';
  } else if (time > 20 && time < 24) {
    return 'Good evening!';
  } else {
    return 'Good night!';
  }
}
