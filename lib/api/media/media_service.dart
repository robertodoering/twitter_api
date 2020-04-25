import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:twitter_api/api/media/data/media_upload.dart';
import 'package:twitter_api/api/twitter_client.dart';
import 'package:twitter_api/src/annotations.dart';
import 'package:twitter_api/src/utils/map_utils.dart';
import 'package:twitter_api/src/utils/transforms.dart';

class MediaService {
  const MediaService({
    @required this.client,
  });

  final TwitterClient client;

  /// The `INIT` command request is used to initiate a file upload session. It
  /// returns a [mediaId] which should be used to execute all subsequent
  /// requests. The next step after a successful return from `INIT` command is
  /// the `APPEND` command.
  ///
  /// See
  /// https://developer.twitter.com/en/docs/media/upload-media/uploading-media/media-best-practices
  /// for constraints and requirements on media files.
  ///
  /// [totalBytes]: The size of the media being uploaded in bytes.
  ///
  /// [mediaType]: The MIME type of the media being uploaded.
  ///
  /// [mediaCategory]: A string enum value which identifies a media usecase.
  /// This identifier is used to enforce usecase specific constraints (e.g. file
  /// size, video duration) and enable advanced features.
  ///
  /// [additionalOwners]: A list of user IDs to set as additional owners allowed
  /// to use the returned [mediaId] in Tweets or Cards. Up to 100 additional
  /// owners may be specified.
  ///
  /// See https://developer.twitter.com/en/docs/media/upload-media/api-reference/post-media-upload-init.
  Future<UploadInit> mediaUploadInit({
    @required int totalBytes,
    @required String mediaType,
    String mediaCategory,
    List<String> additionalOwners,
    TransformResponse<UploadInit> transform = defaultUploadInitTransform,
  }) async {
    final body = <String, String>{}
      ..addParameter('command', 'INIT')
      ..addParameter('total_bytes', totalBytes)
      ..addParameter('media_type', mediaType)
      ..addParameter('media_category', mediaCategory)
      ..addParameter('additional_owners', additionalOwners);

    return client
        .post(
          Uri.https('api.twitter.com', '1.1/media/upload.json'),
          body: body,
        )
        .then(transform);
  }

  /// The `APPEND` command is used to upload a chunk (consecutive byte range) of
  /// the media file. For example, a 3 MB file could be split into 3 chunks of
  /// size 1 MB, and uploaded using 3 `APPEND` command requests. After the
  /// entire file is uploaded, the next step is to call the `FINALIZE` command.
  ///
  /// [mediaId]: The [UploadInit.mediaIdString] returned from the `INIT`
  /// command.
  ///
  /// [media]: The raw binary file content being uploaded. It must be <= 5 MB.
  ///
  /// [segmentIndex]: An ordered index of file chunk. It must be between 0-999
  /// inclusive. The first segment has index 0, second segment has index 1, and
  /// so on.
  ///
  /// See https://developer.twitter.com/en/docs/media/upload-media/api-reference/post-media-upload-append.
  Future<void> mediaUploadAppend({
    @required String mediaId,
    @required List<int> media,
    @required int segmentIndex,
  }) async {
    final params = <String, String>{}
      ..addParameter('command', 'APPEND')
      ..addParameter('media_id', mediaId)
      ..addParameter('segment_index', segmentIndex);

    await client.multipartRequest(
      Uri.https('api.twitter.com', '1.1/media/upload.json', params),
      files: [MultipartFile.fromBytes('media', media)],
    );
  }

  /// The `STATUS` command is used to periodically poll for updates of media
  /// processing operation. After the `STATUS` command response returns
  /// succeeded, you can move on to the next step which is usually create Tweet
  /// with [mediaId].
  ///
  /// [mediaId]: The [mediaId] returned from the `INIT` command.
  ///
  /// See https://developer.twitter.com/en/docs/media/upload-media/api-reference/get-media-upload-status.
  @notImplemented
  Future<UploadStatus> mediaUploadStatus({
    @required String mediaId,
    TransformResponse<UploadStatus> transform = defaultUploadStatusTransform,
  }) async {
    final params = <String, String>{}
      ..addParameter('command', 'STATUS')
      ..addParameter('media_id', mediaId);

    return client
        .get(Uri.https('api.twitter.com', '1.1/media/upload.json', params))
        .then(transform);
  }

  ///
  ///
  /// TODO: implement
  ///
  /// See .
  @notImplemented
  Future<void> a() async {}
}