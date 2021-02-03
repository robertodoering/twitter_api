import 'dart:async' as _i5;
import 'dart:convert' as _i6;

import 'package:dart_twitter_api/api/twitter_client.dart' as _i4;
import 'package:http/src/multipart_file.dart' as _i7;
import 'package:http/src/response.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:oauth1/src/client.dart' as _i2;

// ignore_for_file: comment_references

// ignore_for_file: unnecessary_parenthesis

class _FakeDuration extends _i1.Fake implements Duration {}

class _FakeClient extends _i1.Fake implements _i2.Client {}

class _FakeResponse extends _i1.Fake implements _i3.Response {}

/// A class which mocks [TwitterClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockTwitterClient extends _i1.Mock implements _i4.TwitterClient {
  MockTwitterClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get consumerKey =>
      (super.noSuchMethod(Invocation.getter(#consumerKey), '') as String);
  @override
  set consumerKey(String? _consumerKey) =>
      super.noSuchMethod(Invocation.setter(#consumerKey, _consumerKey));
  @override
  String get consumerSecret =>
      (super.noSuchMethod(Invocation.getter(#consumerSecret), '') as String);
  @override
  set consumerSecret(String? _consumerSecret) =>
      super.noSuchMethod(Invocation.setter(#consumerSecret, _consumerSecret));
  @override
  String get token =>
      (super.noSuchMethod(Invocation.getter(#token), '') as String);
  @override
  set token(String? _token) =>
      super.noSuchMethod(Invocation.setter(#token, _token));
  @override
  String get secret =>
      (super.noSuchMethod(Invocation.getter(#secret), '') as String);
  @override
  set secret(String? _secret) =>
      super.noSuchMethod(Invocation.setter(#secret, _secret));
  @override
  Duration get defaultTimeout =>
      (super.noSuchMethod(Invocation.getter(#defaultTimeout), _FakeDuration())
          as Duration);
  @override
  _i2.Client get oauthClient =>
      (super.noSuchMethod(Invocation.getter(#oauthClient), _FakeClient())
          as _i2.Client);
  @override
  _i5.Future<_i3.Response> get(Uri? uri,
          {Map<String, String>? headers, Duration? timeout}) =>
      (super.noSuchMethod(
          Invocation.method(
              #get, [uri], {#headers: headers, #timeout: timeout}),
          Future.value(_FakeResponse())) as _i5.Future<_i3.Response>);
  @override
  _i5.Future<_i3.Response> post(Uri? uri,
          {Map<String, String>? headers,
          dynamic body,
          _i6.Encoding? encoding,
          Duration? timeout}) =>
      (super.noSuchMethod(
          Invocation.method(#post, [
            uri
          ], {
            #headers: headers,
            #body: body,
            #encoding: encoding,
            #timeout: timeout
          }),
          Future.value(_FakeResponse())) as _i5.Future<_i3.Response>);
  @override
  _i5.Future<_i3.Response> multipartRequest(Uri? uri,
          {List<_i7.MultipartFile>? files,
          Map<String, String>? headers,
          String? method = r'POST',
          Duration? timeout}) =>
      (super.noSuchMethod(
          Invocation.method(#multipartRequest, [
            uri
          ], {
            #files: files,
            #headers: headers,
            #method: method,
            #timeout: timeout
          }),
          Future.value(_FakeResponse())) as _i5.Future<_i3.Response>);
}
