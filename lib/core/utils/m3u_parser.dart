// List<Map<String, String>> parseM3U(String data) {
//   final lines = data.split("\n");
//
//   List<Map<String, String>> channels = [];
//
//   for (int i = 0; i < lines.length; i++) {
//     final line = lines[i];
//
//     if (line.startsWith("#EXTINF")) {
//       final name = line.split(",").last.trim();
//       final streamUrl = lines[i + 1].trim();
//
//       channels.add({
//         "name": name,
//         "logo": "", // optional later
//         "url": streamUrl,
//       });
//     }
//   }
//
//   return channels;
// }

List<Map<String, String>> parseM3U(String content) {
  final lines = content.split('\n');

  List<Map<String, String>> channels = [];

  String name = "";
  String logo = "";
  String group = "";
  String id = "";

  for (int i = 0; i < lines.length; i++) {
    final line = lines[i].trim();

    if (line.startsWith("#EXTINF")) {
      final nameMatch = RegExp(r',(.+)$').firstMatch(line);
      name = nameMatch?.group(1) ?? "";

      final logoMatch = RegExp(r'tvg-logo="([^"]+)"').firstMatch(line);
      logo = logoMatch?.group(1) ?? "";

      final groupMatch = RegExp(r'group-title="([^"]+)"').firstMatch(line);
      group = groupMatch?.group(1) ?? "Other";

      final idMatch = RegExp(r'tvg-id="([^"]+)"').firstMatch(line);
      id = idMatch?.group(1) ?? "";
    }

    if (line.startsWith("http")) {
      channels.add({
        "name": name,
        "logo": logo,
        "group": group,
        "id": id,
        "url": line,
      });
    }
  }

  return channels;
}
