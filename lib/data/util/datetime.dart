import 'package:jiffy/jiffy.dart';

const String format = "MMMM do yyyy, h:mm:ss a";

String toReadable(DateTime dateTime) {
  return Jiffy(dateTime).format(format);
}

DateTime fromEpoch(int epoch) {
  return Jiffy(epoch).dateTime;
}
