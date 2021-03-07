import 'dart:async';

/// Signature for the callback passed to [compute].
///
/// Instances of [ComputeCallback] must be top-level functions or static methods
/// of classes, not closures or instance methods of objects.
typedef ComputeCallback<Q, R> = FutureOr<R> Function(Q message);
