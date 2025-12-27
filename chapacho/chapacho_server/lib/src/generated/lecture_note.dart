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
import 'note_tag.dart' as _i2;
import 'package:chapacho_server/src/generated/protocol.dart' as _i3;

abstract class LectureNote
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = LectureNoteTable();

  static const db = LectureNoteRepository._();

  @override
  int? id;

  int userId;

  String title;

  String audioPath;

  DateTime createdAt;

  int? durationSeconds;

  String? transcript;

  String? formattedContent;

  List<_i2.NoteTag>? tags;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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
      if (tags != null)
        'tags': tags?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static LectureNoteInclude include() {
    return LectureNoteInclude._();
  }

  static LectureNoteIncludeList includeList({
    _i1.WhereExpressionBuilder<LectureNoteTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LectureNoteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LectureNoteTable>? orderByList,
    LectureNoteInclude? include,
  }) {
    return LectureNoteIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(LectureNote.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(LectureNote.t),
      include: include,
    );
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

class LectureNoteUpdateTable extends _i1.UpdateTable<LectureNoteTable> {
  LectureNoteUpdateTable(super.table);

  _i1.ColumnValue<int, int> userId(int value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<String, String> title(String value) => _i1.ColumnValue(
    table.title,
    value,
  );

  _i1.ColumnValue<String, String> audioPath(String value) => _i1.ColumnValue(
    table.audioPath,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<int, int> durationSeconds(int? value) => _i1.ColumnValue(
    table.durationSeconds,
    value,
  );

  _i1.ColumnValue<String, String> transcript(String? value) => _i1.ColumnValue(
    table.transcript,
    value,
  );

  _i1.ColumnValue<String, String> formattedContent(String? value) =>
      _i1.ColumnValue(
        table.formattedContent,
        value,
      );

  _i1.ColumnValue<List<_i2.NoteTag>, List<_i2.NoteTag>> tags(
    List<_i2.NoteTag>? value,
  ) => _i1.ColumnValue(
    table.tags,
    value,
  );
}

class LectureNoteTable extends _i1.Table<int?> {
  LectureNoteTable({super.tableRelation}) : super(tableName: 'lecture_note') {
    updateTable = LectureNoteUpdateTable(this);
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    audioPath = _i1.ColumnString(
      'audioPath',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    durationSeconds = _i1.ColumnInt(
      'durationSeconds',
      this,
    );
    transcript = _i1.ColumnString(
      'transcript',
      this,
    );
    formattedContent = _i1.ColumnString(
      'formattedContent',
      this,
    );
    tags = _i1.ColumnSerializable<List<_i2.NoteTag>>(
      'tags',
      this,
    );
  }

  late final LectureNoteUpdateTable updateTable;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnString title;

  late final _i1.ColumnString audioPath;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnInt durationSeconds;

  late final _i1.ColumnString transcript;

  late final _i1.ColumnString formattedContent;

  late final _i1.ColumnSerializable<List<_i2.NoteTag>> tags;

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    title,
    audioPath,
    createdAt,
    durationSeconds,
    transcript,
    formattedContent,
    tags,
  ];
}

class LectureNoteInclude extends _i1.IncludeObject {
  LectureNoteInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => LectureNote.t;
}

class LectureNoteIncludeList extends _i1.IncludeList {
  LectureNoteIncludeList._({
    _i1.WhereExpressionBuilder<LectureNoteTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(LectureNote.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => LectureNote.t;
}

class LectureNoteRepository {
  const LectureNoteRepository._();

  /// Returns a list of [LectureNote]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<LectureNote>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LectureNoteTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LectureNoteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LectureNoteTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<LectureNote>(
      where: where?.call(LectureNote.t),
      orderBy: orderBy?.call(LectureNote.t),
      orderByList: orderByList?.call(LectureNote.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [LectureNote] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<LectureNote?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LectureNoteTable>? where,
    int? offset,
    _i1.OrderByBuilder<LectureNoteTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LectureNoteTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<LectureNote>(
      where: where?.call(LectureNote.t),
      orderBy: orderBy?.call(LectureNote.t),
      orderByList: orderByList?.call(LectureNote.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [LectureNote] by its [id] or null if no such row exists.
  Future<LectureNote?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<LectureNote>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [LectureNote]s in the list and returns the inserted rows.
  ///
  /// The returned [LectureNote]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<LectureNote>> insert(
    _i1.Session session,
    List<LectureNote> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<LectureNote>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [LectureNote] and returns the inserted row.
  ///
  /// The returned [LectureNote] will have its `id` field set.
  Future<LectureNote> insertRow(
    _i1.Session session,
    LectureNote row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<LectureNote>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [LectureNote]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<LectureNote>> update(
    _i1.Session session,
    List<LectureNote> rows, {
    _i1.ColumnSelections<LectureNoteTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<LectureNote>(
      rows,
      columns: columns?.call(LectureNote.t),
      transaction: transaction,
    );
  }

  /// Updates a single [LectureNote]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<LectureNote> updateRow(
    _i1.Session session,
    LectureNote row, {
    _i1.ColumnSelections<LectureNoteTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<LectureNote>(
      row,
      columns: columns?.call(LectureNote.t),
      transaction: transaction,
    );
  }

  /// Updates a single [LectureNote] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<LectureNote?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<LectureNoteUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<LectureNote>(
      id,
      columnValues: columnValues(LectureNote.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [LectureNote]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<LectureNote>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<LectureNoteUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<LectureNoteTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LectureNoteTable>? orderBy,
    _i1.OrderByListBuilder<LectureNoteTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<LectureNote>(
      columnValues: columnValues(LectureNote.t.updateTable),
      where: where(LectureNote.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(LectureNote.t),
      orderByList: orderByList?.call(LectureNote.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [LectureNote]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<LectureNote>> delete(
    _i1.Session session,
    List<LectureNote> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<LectureNote>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [LectureNote].
  Future<LectureNote> deleteRow(
    _i1.Session session,
    LectureNote row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<LectureNote>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<LectureNote>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<LectureNoteTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<LectureNote>(
      where: where(LectureNote.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LectureNoteTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<LectureNote>(
      where: where?.call(LectureNote.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
