import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:html_unescape/html_unescape_small.dart';

final htmlUnescapeProvider = Provider<HtmlUnescape>((ref) {
  return HtmlUnescape();
});
