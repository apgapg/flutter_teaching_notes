printLog(dynamic o, {bool upload = false, StackTrace stackTrace}) {
  if (isDebug) {
    print(o.toString() ?? "");
    if (stackTrace != null) print(stackTrace);
  } //else if (upload) CrashUtils.logError(error: o.toString(), stackTrace: stackTrace);
}

bool get isDebug {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}
