import 'dart:convert';

class LectureBlock {
  final String text;
  final String? tag; // "important", "exam", "question"
  final int timestampSeconds; // For jumping to audio later

  LectureBlock({
    required this.text,
    this.tag,
    required this.timestampSeconds,
  });

  // Convert to Map for saving to Server
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'tag': tag,
      't': timestampSeconds,
    };
  }

  // Create from Map when reading from Server
  factory LectureBlock.fromMap(Map<String, dynamic> map) {
    return LectureBlock(
      text: map['text'] ?? '',
      tag: map['tag'],
      timestampSeconds: map['t'] ?? 0,
    );
  }

  // Helpers to encode/decode the whole list
  static String encodeList(List<LectureBlock> blocks) {
    return jsonEncode(blocks.map((b) => b.toMap()).toList());
  }

  static List<LectureBlock> decodeList(String jsonStr) {
    if (jsonStr.isEmpty) return [];
    final List<dynamic> parsed = jsonDecode(jsonStr);
    return parsed.map((e) => LectureBlock.fromMap(e)).toList();
  }
}