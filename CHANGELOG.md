# 0.5.5

- Fixed unable to parse dates when the dart environment locale was set to some non-en_US locales (Thanks @jonjomckay!)

# 0.5.4

- Fixed `ListService.membersCreate` request (Thanks @nikolajjsj!)
- Fixed `count` param was not included in `TweetService.retweets` (Thanks @dre8597!)

# 0.5.3

- Added `ListsService` with implementations for all `lists/*` endpoints

# 0.5.2

- Fixed twitter client non-2xx response not returned correctly

# 0.5.1

- Fixed twitter client forcing header argument to be non null

# 0.5.0

- Added support for web

# 0.4.0

- Migrated to null safety

# 0.3.5

- Added `TrendsService` with implementations for all `trends/*` endpoints
- Raised `oauth` dependency to include a bugfix where authentication failed when
  some special characters where included in the request
  Thanks @nikolajjsj!

# 0.3.4

- Fixed user timeline `userId` & `screenName` request parameter

# 0.3.3

- Added user entities to the `User` object

# 0.3.2

- Implemented the `friendships/lookup` request
- Added the `status` object for a `User`
- Added more exports to the `twitter_api.dart` library

# 0.3.1

- Fixed `DateTime` in response models not set to UTC

# 0.3.0

- Fixed using the `Size` object instead of `Sizes` in the tweet media object
- Added `VideoInfo` and `AdditionalMediaInfo` to the tweet media object

# 0.2.1

- Fixed parsing a `PaginatedUsers` response

# 0.2.0

- Added the user service

# 0.1.1

- Added support to change the twitter client default timeout
- Added support to change the twitter client api keys & token after instantiation

# 0.1.0+1

- Updated readme

# 0.1.0

- Initial release
