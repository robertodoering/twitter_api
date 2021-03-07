import 'isolates.dart';

/// The dart:html implementation of [compute].
Future<R> compute<Q, R>(ComputeCallback<Q, R> callback, Q message) async {
  // To avoid blocking the UI immediately for an expensive function call, we
  // pump a single frame to allow the framework to complete the current set
  // of work.
  await null;
  return callback(message);
}
