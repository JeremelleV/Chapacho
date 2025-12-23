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
import 'package:serverpod/serverpod.dart' as _i1;

abstract class NoteTag
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  NoteTag._({
    required this.type,
    required this.timestamp,
  });

  factory NoteTag({
    required String type,
    required int timestamp,
  }) = _NoteTagImpl;

  factory NoteTag.fromJson(Map<String, dynamic> jsonSerialization) {
    return NoteTag(
      type: jsonSerialization['type'] as String,
      timestamp: jsonSerialization['timestamp'] as int,
    );
  }

  String type;

  int timestamp;

  /// Returns a shallow copy of this [NoteTag]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  NoteTag copyWith({
    String? type,
    int? timestamp,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'NoteTag',
      'type': type,
      'timestamp': timestamp,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'NoteTag',
      'type': type,
      'timestamp': timestamp,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _NoteTagImpl extends NoteTag {
  _NoteTagImpl({
    required String type,
    required int timestamp,
  }) : super._(
         type: type,
         timestamp: timestamp,
       );

  /// Returns a shallow copy of this [NoteTag]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  NoteTag copyWith({
    String? type,
    int? timestamp,
  }) {
    return NoteTag(
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
