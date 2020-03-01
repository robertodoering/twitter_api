class _NotImplemented {
  const _NotImplemented();
}

/// The annotation `@notImplemented` marks a parameter as (currently) not
/// implemented or supported.
///
/// The parameter may be used in the request, but any consequent changes of the
/// response are likely not parsed.
const Object notImplemented = _NotImplemented();
