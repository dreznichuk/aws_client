String canonicalQueryParameters(Map<String, String> query) {
  return canonicalQueryParametersAll(
      query.map((key, value) => MapEntry(key, [value])));
}

String canonicalQueryParametersAll(Map<String, List<String>> query, { bool forSignature = true }) {
  String encodeComponent(String input) =>
      Uri.encodeQueryComponent(input).replaceAll('+', '%20');

  final items = <String>[];
  for (var key in query.keys) {
    for (var value in query[key]!) {
      if ( forSignature || value.isNotEmpty ) {
        items.add('${encodeComponent(key)}=${encodeComponent(value)}');
      } else {
        items.add(encodeComponent(key));
      }
    }
  }
  items.sort();
  return items.join('&');
}
