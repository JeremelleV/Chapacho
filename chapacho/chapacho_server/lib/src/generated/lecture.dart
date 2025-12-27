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

abstract class Lecture
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = LectureTable();

  static const db = LectureRepository._();

  @override
  int? id;

  String title;

  DateTime date;

  int durationSeconds;

  int userId;

  String contentJson;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
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

  static LectureInclude include() {
    return LectureInclude._();
  }

  static LectureIncludeList includeList({
    _i1.WhereExpressionBuilder<LectureTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LectureTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LectureTable>? orderByList,
    LectureInclude? include,
  }) {
    return LectureIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Lecture.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Lecture.t),
      include: include,
    );
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

class LectureUpdateTable extends _i1.UpdateTable<LectureTable> {
  LectureUpdateTable(super.table);

  _i1.ColumnValue<String, String> title(String value) => _i1.ColumnValue(
    table.title,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> date(DateTime value) => _i1.ColumnValue(
    table.date,
    value,
  );

  _i1.ColumnValue<int, int> durationSeconds(int value) => _i1.ColumnValue(
    table.durationSeconds,
    value,
  );

  _i1.ColumnValue<int, int> userId(int value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<String, String> contentJson(String value) => _i1.ColumnValue(
    table.contentJson,
    value,
  );
}

class LectureTable extends _i1.Table<int?> {
  LectureTable({super.tableRelation}) : super(tableName: 'lecture') {
    updateTable = LectureUpdateTable(this);
    title = _i1.ColumnString(
      'title',
      this,
    );
    date = _i1.ColumnDateTime(
      'date',
      this,
    );
    durationSeconds = _i1.ColumnInt(
      'durationSeconds',
      this,
    );
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    contentJson = _i1.ColumnString(
      'contentJson',
      this,
    );
  }

  late final LectureUpdateTable updateTable;

  late final _i1.ColumnString title;

  late final _i1.ColumnDateTime date;

  late final _i1.ColumnInt durationSeconds;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnString contentJson;

  @override
  List<_i1.Column> get columns => [
    id,
    title,
    date,
    durationSeconds,
    userId,
    contentJson,
  ];
}

class LectureInclude extends _i1.IncludeObject {
  LectureInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => Lecture.t;
}

class LectureIncludeList extends _i1.IncludeList {
  LectureIncludeList._({
    _i1.WhereExpressionBuilder<LectureTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Lecture.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Lecture.t;
}

class LectureRepository {
  const LectureRepository._();

  /// Returns a list of [Lecture]s matching the given query parameters.
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
  Future<List<Lecture>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LectureTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LectureTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LectureTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Lecture>(
      where: where?.call(Lecture.t),
      orderBy: orderBy?.call(Lecture.t),
      orderByList: orderByList?.call(Lecture.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [Lecture] matching the given query parameters.
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
  Future<Lecture?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LectureTable>? where,
    int? offset,
    _i1.OrderByBuilder<LectureTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LectureTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Lecture>(
      where: where?.call(Lecture.t),
      orderBy: orderBy?.call(Lecture.t),
      orderByList: orderByList?.call(Lecture.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [Lecture] by its [id] or null if no such row exists.
  Future<Lecture?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Lecture>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [Lecture]s in the list and returns the inserted rows.
  ///
  /// The returned [Lecture]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Lecture>> insert(
    _i1.Session session,
    List<Lecture> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Lecture>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Lecture] and returns the inserted row.
  ///
  /// The returned [Lecture] will have its `id` field set.
  Future<Lecture> insertRow(
    _i1.Session session,
    Lecture row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Lecture>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Lecture]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Lecture>> update(
    _i1.Session session,
    List<Lecture> rows, {
    _i1.ColumnSelections<LectureTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Lecture>(
      rows,
      columns: columns?.call(Lecture.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Lecture]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Lecture> updateRow(
    _i1.Session session,
    Lecture row, {
    _i1.ColumnSelections<LectureTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Lecture>(
      row,
      columns: columns?.call(Lecture.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Lecture] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Lecture?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<LectureUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Lecture>(
      id,
      columnValues: columnValues(Lecture.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Lecture]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Lecture>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<LectureUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<LectureTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LectureTable>? orderBy,
    _i1.OrderByListBuilder<LectureTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Lecture>(
      columnValues: columnValues(Lecture.t.updateTable),
      where: where(Lecture.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Lecture.t),
      orderByList: orderByList?.call(Lecture.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Lecture]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Lecture>> delete(
    _i1.Session session,
    List<Lecture> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Lecture>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Lecture].
  Future<Lecture> deleteRow(
    _i1.Session session,
    Lecture row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Lecture>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Lecture>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<LectureTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Lecture>(
      where: where(Lecture.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LectureTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Lecture>(
      where: where?.call(Lecture.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
