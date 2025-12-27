/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'note_tag.dart' as _i2;
import 'package:chapacho_client/src/protocol/protocol.dart' as _i3;

abstract class LectureNote implements _i1.SerializableModel {
  LectureNote._({
    this.id,
    required this.userId,
    required this.title,
    required this.audioPath,
    required this.createdAt,
    this.durationSeconds,
    this.transcript,
    this.formattedContent,
    this.tags,
  });

  factory LectureNote({
    int? id,
    required int userId,
    required String title,
    required String audioPath,
    required DateTime createdAt,
    int? durationSeconds,
    String? transcript,
    String? formattedContent,
    List<_i2.NoteTag>? tags,
  }) = _LectureNoteImpl;

  factory LectureNote.fromJson(Map<String, dynamic> jsonSerialization) {
    return LectureNote(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      title: jsonSerialization['title'] as String,
      audioPath: jsonSerialization['audioPath'] as String,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      durationSeconds: jsonSerialization['durationSeconds'] as int?,
      transcript: jsonSerialization['transcript'] as String?,
      formattedContent: jsonSerialization['formattedContent'] as String?,
      tags: jsonSerialization['tags'] == null
          ? null
          : _i3.Protocol().deserialize<List<_i2.NoteTag>>(
              jsonSerialization['tags'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  String title;

  String audioPath;

  DateTime createdAt;

  int? durationSeconds;

  String? transcript;

  String? formattedContent;

  List<_i2.NoteTag>? tags;

  /// Returns a shallow copy of this [LectureNote]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LectureNote copyWith({
    int? id,
    int? userId,
    String? title,
    String? audioPath,
    DateTime? createdAt,
    int? durationSeconds,
    String? transcript,
    String? formattedContent,
    List<_i2.NoteTag>? tags,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LectureNote',
      if (id != null) 'id': id,
      'userId': userId,
      'title': title,
      'audioPath': audioPath,
      'createdAt': createdAt.toJson(),
      if (durationSeconds != null) 'durationSeconds': durationSeconds,
      if (transcript != null) 'transcript': transcript,
      if (formattedContent != null) 'formattedContent': formattedContent,
      if (tags != null) 'tags': tags?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LectureNoteImpl extends LectureNote {
  _LectureNoteImpl({
    int? id,
    required int userId,
    required String title,
    required String audioPath,
    required DateTime createdAt,
    int? durationSeconds,
    String? transcript,
    String? formattedContent,
    List<_i2.NoteTag>? tags,
  }) : super._(
         id: id,
         userId: userId,
         title: title,
         audioPath: audioPath,
         createdAt: createdAt,
         durationSeconds: durationSeconds,
         transcript: transcript,
         formattedContent: formattedContent,
         tags: tags,
       );

  /// Returns a shallow copy of this [LectureNote]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LectureNote copyWith({
    Object? id = _Undefined,
    int? userId,
    String? title,
    String? audioPath,
    DateTime? createdAt,
    Object? durationSeconds = _Undefined,
    Object? transcript = _Undefined,
    Object? formattedContent = _Undefined,
    Object? tags = _Undefined,
  }) {
    return LectureNote(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      audioPath: audioPath ?? this.audioPath,
      createdAt: createdAt ?? this.createdAt,
      durationSeconds: durationSeconds is int?
          ? durationSeconds
          : this.durationSeconds,
      transcript: transcript is String? ? transcript : this.transcript,
      formattedContent: formattedContent is String?
          ? formattedContent
          : this.formattedContent,
      tags: tags is List<_i2.NoteTag>?
          ? tags
          : this.tags?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
