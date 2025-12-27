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

abstract class Lecture implements _i1.SerializableModel {
  Lecture._({
    this.id,
    required this.title,
    required this.date,
    required this.durationSeconds,
    required this.userId,
    required this.contentJson,
  });

  factory Lecture({
    int? id,
    required String title,
    required DateTime date,
    required int durationSeconds,
    required int userId,
    required String contentJson,
  }) = _LectureImpl;

  factory Lecture.fromJson(Map<String, dynamic> jsonSerialization) {
    return Lecture(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      durationSeconds: jsonSerialization['durationSeconds'] as int,
      userId: jsonSerialization['userId'] as int,
      contentJson: jsonSerialization['contentJson'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String title;

  DateTime date;

  int durationSeconds;

  int userId;

  String contentJson;

  /// Returns a shallow copy of this [Lecture]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Lecture copyWith({
    int? id,
    String? title,
    DateTime? date,
    int? durationSeconds,
    int? userId,
    String? contentJson,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Lecture',
      if (id != null) 'id': id,
      'title': title,
      'date': date.toJson(),
      'durationSeconds': durationSeconds,
      'userId': userId,
      'contentJson': contentJson,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LectureImpl extends Lecture {
  _LectureImpl({
    int? id,
    required String title,
    required DateTime date,
    required int durationSeconds,
    required int userId,
    required String contentJson,
  }) : super._(
         id: id,
         title: title,
         date: date,
         durationSeconds: durationSeconds,
         userId: userId,
         contentJson: contentJson,
       );

  /// Returns a shallow copy of this [Lecture]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Lecture copyWith({
    Object? id = _Undefined,
    String? title,
    DateTime? date,
    int? durationSeconds,
    int? userId,
    String? contentJson,
  }) {
    return Lecture(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      userId: userId ?? this.userId,
      contentJson: contentJson ?? this.contentJson,
    );
  }
}
