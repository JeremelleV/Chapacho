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
import 'greetings/greeting.dart' as _i2;
import 'lecture_note.dart' as _i3;
import 'note_tag.dart' as _i4;
import 'package:chapacho_client/src/protocol/note_tag.dart' as _i5;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i6;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i7;
export 'greetings/greeting.dart';
export 'lecture_note.dart';
export 'note_tag.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i2.Greeting) {
      return _i2.Greeting.fromJson(data) as T;
    }
    if (t == _i3.LectureNote) {
      return _i3.LectureNote.fromJson(data) as T;
    }
    if (t == _i4.NoteTag) {
      return _i4.NoteTag.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Greeting?>()) {
      return (data != null ? _i2.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.LectureNote?>()) {
      return (data != null ? _i3.LectureNote.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.NoteTag?>()) {
      return (data != null ? _i4.NoteTag.fromJson(data) : null) as T;
    }
    if (t == List<_i4.NoteTag>) {
      return (data as List).map((e) => deserialize<_i4.NoteTag>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i4.NoteTag>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i4.NoteTag>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i5.NoteTag>) {
      return (data as List).map((e) => deserialize<_i5.NoteTag>(e)).toList()
          as T;
    }
    try {
      return _i6.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i7.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.Greeting => 'Greeting',
      _i3.LectureNote => 'LectureNote',
      _i4.NoteTag => 'NoteTag',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('chapacho.', '');
    }

    switch (data) {
      case _i2.Greeting():
        return 'Greeting';
      case _i3.LectureNote():
        return 'LectureNote';
      case _i4.NoteTag():
        return 'NoteTag';
    }
    className = _i6.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i7.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i2.Greeting>(data['data']);
    }
    if (dataClassName == 'LectureNote') {
      return deserialize<_i3.LectureNote>(data['data']);
    }
    if (dataClassName == 'NoteTag') {
      return deserialize<_i4.NoteTag>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i6.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i7.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
