import 'package:intl/intl.dart';

/// Creates a [DateTime] from a Twitter timestamp.
///
/// Returns `null`, if [twitterDateString] is `null` or was unable to be parsed.
DateTime? convertTwitterDateTime(String? twitterDateString) {
  if (twitterDateString == null) {
    return null;
  }

  try {
    return DateTime.parse(twitterDateString);
  } catch (e) {
    try {
      final dateString = formatTwitterDateString(twitterDateString);
      return DateFormat('E MMM dd HH:mm:ss yyyy').parse(dateString, true);
    } catch (e) {
      return null;
    }
  }
}

/// Removes the timezone to allow [DateTime] to parse the string.
///
/// The date strings are always in UTC and the timezone difference is 0,
/// therefore no information is lost by removing the timezone.
String formatTwitterDateString(String twitterDateString) {
  final List sanitized = twitterDateString.split(' ')
    ..removeWhere((part) => part.startsWith('+'));

  return sanitized.join(' ');
}
