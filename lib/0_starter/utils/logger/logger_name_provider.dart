mixin LoggerNameProvider {
  String get loggerName => '$runtimeType #${identityHashCode(this)}';
}
