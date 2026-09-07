import 'dart:async';

typedef _InitializationStep = FutureOr<void> Function();
typedef InitializationResult = ({String name, double progress});

Stream<InitializationResult> initDependencies() async* {
  final percent = 100 / _initializationSteps.length;

  for (int i = 0; i < _initializationSteps.length; i++) {
    final step = _initializationSteps.entries.elementAt(i);
    await step.value();
    yield (name: step.key, progress: percent * (i + 1));
  }
}

Future<void> _fakeDelay() async {
  await Future.delayed(const Duration(milliseconds: 500));
}

Map<String, _InitializationStep> get _initializationSteps => <String, _InitializationStep>{
  'App Meta Data': _fakeDelay,
  'Database': _fakeDelay,
  'Services': _fakeDelay,
  'Observers': _fakeDelay,
  'Firebase': _fakeDelay,
};
