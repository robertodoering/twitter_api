extension ParameterExtension on Map<String, String> {
  /// Adds an entry to the map.
  ///
  /// If [value] is `null`, it is not added to the map.
  /// If [value] is a [List], the list is joined with a `,`.
  /// Else, the [value.toString()] is used.
  void addParameter(String param, dynamic value) {
    if (value is List) {
      this[param] = value.join(',');
    } else if (value != null) {
      this[param] = '$value';
    }
  }
}
