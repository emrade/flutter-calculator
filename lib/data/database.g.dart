// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? join(await sqflite.getDatabasesPath(), name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CalculationDao _calculationDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    return sqflite.openDatabase(
      path,
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `calculations` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `equation` TEXT, `result` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
  }

  @override
  CalculationDao get calculationDao {
    return _calculationDaoInstance ??=
        _$CalculationDao(database, changeListener);
  }
}

class _$CalculationDao extends CalculationDao {
  _$CalculationDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _calculationInsertionAdapter = InsertionAdapter(
            database,
            'calculations',
            (Calculation item) => <String, dynamic>{
                  'id': item.id,
                  'equation': item.equation,
                  'result': item.result
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _calculationsMapper = (Map<String, dynamic> row) =>
      Calculation(row['equation'] as String, row['result'] as String);

  final InsertionAdapter<Calculation> _calculationInsertionAdapter;

  @override
  Future<List<Calculation>> index() async {
    return _queryAdapter.queryList('SELECT * FROM calculations',
        mapper: _calculationsMapper);
  }

  @override
  Stream<List<Calculation>> indexStream() {
    return _queryAdapter.queryListStream('SELECT * FROM calculations',
        tableName: 'calculations', mapper: _calculationsMapper);
  }

  @override
  Future<void> clear() async {
    await _queryAdapter.queryNoReturn('DELETE FROM calculations');
  }

  @override
  Future<void> save(Calculation calculation) async {
    await _calculationInsertionAdapter.insert(
        calculation, sqflite.ConflictAlgorithm.abort);
  }
}
