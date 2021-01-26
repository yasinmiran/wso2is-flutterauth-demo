import 'dart:developer';

const debugLogsEnabled = true;
const debugStackTraceEnabled = false;

void logMessage<T>(
  T source,
  Object message, [
  Object message2,
  Object message3,
  Object message4,
  Object message5,
  Object message6,
  Object message7,
  Object message8,
  Object message9,
  Object message10,
]) {
  if (debugLogsEnabled) {
    _LogMessage ins = _LogMessage("{${DateTime.now()}} [${source.runtimeType}]: ");
    _appendMessage(ins, message);
    _appendMessage(ins, message2);
    _appendMessage(ins, message3);
    _appendMessage(ins, message4);
    _appendMessage(ins, message5);
    _appendMessage(ins, message6);
    _appendMessage(ins, message7);
    _appendMessage(ins, message8);
    _appendMessage(ins, message9);
    _appendMessage(ins, message10);
    if (debugStackTraceEnabled) {
      var trace = StackTrace.current?.toString();
      _appendMessage(ins, "\nCurrent `StackTrace` of above ^ log:\n");
      _appendMessage(ins, trace);
      _appendMessage(ins, "End StackTrace ---------------------------------");
    }
    log(ins.log);
  }
}

void _appendMessage(_LogMessage target, Object message) {
  if (message != null) {
    target.log = "${target.log} ${message.toString()}";
  }
}

class _LogMessage {
  String log;

  _LogMessage(this.log);
}
