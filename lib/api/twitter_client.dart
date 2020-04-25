import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:oauth1/oauth1.dart' as oauth1;

/// A function used to transform the response.
///
/// To prevent large computations from blocking the thread, consider decoding
/// the response body in an isolate. When using `Flutter`, consider using the
/// `compute` method.
typedef TransformResponse<T> = FutureOr<T> Function(Response response);

class TwitterClient {
  const TwitterClient({
    @required this.consumerKey,
    @required this.consumerSecret,
    @required this.token,
    @required this.secret,
  });

  final String consumerKey;
  final String consumerSecret;
  final String token;
  final String secret;

  oauth1.Platform get _platform {
    return oauth1.Platform(
      'https://api.twitter.com/oauth/request_token',
      'https://api.twitter.com/oauth/authorize',
      'https://api.twitter.com/oauth/access_token',
      oauth1.SignatureMethods.hmacSha1,
    );
  }

  oauth1.ClientCredentials get _clientCredentials {
    return oauth1.ClientCredentials(
      consumerKey,
      consumerSecret,
    );
  }

  oauth1.Client get client {
    return oauth1.Client(
      _platform.signatureMethod,
      _clientCredentials,
      oauth1.Credentials(token, secret),
    );
  }

  Future<Response> get(
    dynamic uri, {
    Map<String, String> headers,
    Duration timeout = _kDefaultTimeout,
  }) {
    return client.get(uri, headers: headers).timeout(timeout).then((response) {
      return response.statusCode >= 200 && response.statusCode < 300
          ? response
          : Future.error(response);
    });
  }

  Future<Response> post(
    dynamic uri, {
    Map<String, String> headers,
    dynamic body,
    Encoding encoding,
    Duration timeout = _kDefaultTimeout,
  }) {
    return client
        .post(uri, headers: headers, body: body, encoding: encoding)
        .timeout(timeout)
        .then((response) {
      return response.statusCode >= 200 && response.statusCode < 300
          ? response
          : Future.error(response);
    });
  }

  Future<Response> multipartRequest(
    dynamic uri, {
    List<MultipartFile> files,
    Map<String, String> headers,
    Duration timeout = _kDefaultTimeout,
  }) async {
    final request = MultipartRequest(
      'POST',
      uri is String ? Uri.parse(uri) : uri as Uri,
    );

    if (files != null) {
      request.files.addAll(files);
    }

    if (headers != null) {
      request.headers.addAll(headers);
    }

    return Response.fromStream(await client.send(request))
        .timeout(timeout)
        .then((response) {
      return response.statusCode >= 200 && response.statusCode < 300
          ? response
          : Future.error(response);
    });
  }
}

const Duration _kDefaultTimeout = Duration(seconds: 10);
