import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

/// Signature for the callback passed to [compute].
///
/// Instances of [ComputeCallback] must be top-level functions or static methods
/// of classes, not closures or instance methods of objects.
typedef ComputeCallback<Q, R> = FutureOr<R> Function(Q message);

/// The dart:io implementation of [isolate.compute].
Future<R> compute<Q, R>(ComputeCallback<Q, R> callback, Q message) async {
  final flow = Flow.begin();
  Timeline.startSync('$compute: start', flow: flow);
  final resultPort = ReceivePort();
  final errorPort = ReceivePort();
  Timeline.finishSync();
  final isolate = await Isolate.spawn<_IsolateConfiguration<Q, FutureOr<R>>>(
    _spawn,
    _IsolateConfiguration<Q, FutureOr<R>>(
      callback,
      message,
      resultPort.sendPort,
      'compute',
      flow.id,
    ),
    errorsAreFatal: true,
    onExit: resultPort.sendPort,
    onError: errorPort.sendPort,
  );
  final result = Completer<R>();
  errorPort.listen((dynamic errorData) {
    assert(errorData is List<dynamic>);
    assert(errorData.length == 2);
    final exception = Exception(errorData[0]);
    final stack = StackTrace.fromString(errorData[1] as String);
    if (result.isCompleted) {
      Zone.current.handleUncaughtError(exception, stack);
    } else {
      result.completeError(exception, stack);
    }
  });
  resultPort.listen((dynamic resultData) {
    assert(resultData == null || resultData is R);
    if (!result.isCompleted) result.complete(resultData as R?);
  });
  await result.future;
  Timeline.startSync('$compute: end', flow: Flow.end(flow.id));
  resultPort.close();
  errorPort.close();
  isolate.kill();
  Timeline.finishSync();
  return result.future;
}

class _IsolateConfiguration<Q, R> {
  const _IsolateConfiguration(
    this.callback,
    this.message,
    this.resultPort,
    this.debugLabel,
    this.flowId,
  );
  final ComputeCallback<Q, R> callback;
  final Q message;
  final SendPort resultPort;
  final String debugLabel;
  final int flowId;

  FutureOr<R> apply() => callback(message);
}

Future<void> _spawn<Q, R>(
  _IsolateConfiguration<Q, FutureOr<R>> configuration,
) async {
  R? result;
  await Timeline.timeSync(
    configuration.debugLabel,
    () async {
      final FutureOr<R> applicationResult = await (configuration.apply() as FutureOr<R>);
      result = await applicationResult;
    },
    flow: Flow.step(configuration.flowId),
  );
  Timeline.timeSync(
    '${configuration.debugLabel}: returning result',
    () {
      configuration.resultPort.send(result);
    },
    flow: Flow.step(configuration.flowId),
  );
}
