class _NotImplemented {
  const _NotImplemented();
}

/// The annotation `@notImplemented` marks a method or parameter as (currently)
/// not implemented or supported.
///
/// If a parameter is not implemented, it may be used in the request but any
/// consequent changes of the response are likely not handled.
const Object notImplemented = _NotImplemented();
