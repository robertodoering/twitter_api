import 'dart:convert';

import 'package:dart_twitter_api/twitter_api.dart';
import 'package:http/http.dart';

/// An abstraction to make http calls to the Twitter API used by the
/// services.
///
/// Implemented by [TwitterClient].
abstract class AbstractTwitterClient {
  const AbstractTwitterClient();

  Future<Response> get(
    dynamic uri, {
    Map<String, String>? headers,
    Duration? timeout,
  });

  Future<Response> post(
    dynamic uri, {
    Map<String, String>? headers,
    dynamic body,
    Encoding? encoding,
    Duration? timeout,
  });

  Future<Response> multipartRequest(
    dynamic uri, {
    List<MultipartFile>? files,
    Map<String, String>? headers,
    Duration? timeout,
  });
}
