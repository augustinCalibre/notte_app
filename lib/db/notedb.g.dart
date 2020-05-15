// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notedb.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class NoteData extends DataClass implements Insertable<NoteData> {
  final String titre;
  final String description;
  final DateTime date;
  final bool etat;
  NoteData(
      {@required this.titre,
      @required this.description,
      this.date,
      @required this.etat});
  factory NoteData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
    return NoteData(
      titre:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}titre']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      date:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}date']),
      etat: boolType.mapFromDatabaseResponse(data['${effectivePrefix}etat']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || titre != null) {
      map['titre'] = Variable<String>(titre);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || etat != null) {
      map['etat'] = Variable<bool>(etat);
    }
    return map;
  }

  factory NoteData.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return NoteData(
      titre: serializer.fromJson<String>(json['titre']),
      description: serializer.fromJson<String>(json['description']),
      date: serializer.fromJson<DateTime>(json['date']),
      etat: serializer.fromJson<bool>(json['etat']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'titre': serializer.toJson<String>(titre),
      'description': serializer.toJson<String>(description),
      'date': serializer.toJson<DateTime>(date),
      'etat': serializer.toJson<bool>(etat),
    };
  }

  NoteData copyWith(
          {String titre, String description, DateTime date, bool etat}) =>
      NoteData(
        titre: titre ?? this.titre,
        description: description ?? this.description,
        date: date ?? this.date,
        etat: etat ?? this.etat,
      );
  @override
  String toString() {
    return (StringBuffer('NoteData(')
          ..write('titre: $titre, ')
          ..write('description: $description, ')
          ..write('date: $date, ')
          ..write('etat: $etat')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(titre.hashCode,
      $mrjc(description.hashCode, $mrjc(date.hashCode, etat.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is NoteData &&
          other.titre == this.titre &&
          other.description == this.description &&
          other.date == this.date &&
          other.etat == this.etat);
}

class NoteCompanion extends UpdateCompanion<NoteData> {
  final Value<String> titre;
  final Value<String> description;
  final Value<DateTime> date;
  final Value<bool> etat;
  const NoteCompanion({
    this.titre = const Value.absent(),
    this.description = const Value.absent(),
    this.date = const Value.absent(),
    this.etat = const Value.absent(),
  });
  NoteCompanion.insert({
    @required String titre,
    @required String description,
    this.date = const Value.absent(),
    this.etat = const Value.absent(),
  })  : titre = Value(titre),
        description = Value(description);
  static Insertable<NoteData> custom({
    Expression<String> titre,
    Expression<String> description,
    Expression<DateTime> date,
    Expression<bool> etat,
  }) {
    return RawValuesInsertable({
      if (titre != null) 'titre': titre,
      if (description != null) 'description': description,
      if (date != null) 'date': date,
      if (etat != null) 'etat': etat,
    });
  }

  NoteCompanion copyWith(
      {Value<String> titre,
      Value<String> description,
      Value<DateTime> date,
      Value<bool> etat}) {
    return NoteCompanion(
      titre: titre ?? this.titre,
      description: description ?? this.description,
      date: date ?? this.date,
      etat: etat ?? this.etat,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (titre.present) {
      map['titre'] = Variable<String>(titre.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (etat.present) {
      map['etat'] = Variable<bool>(etat.value);
    }
    return map;
  }
}

class $NoteTable extends Note with TableInfo<$NoteTable, NoteData> {
  final GeneratedDatabase _db;
  final String _alias;
  $NoteTable(this._db, [this._alias]);
  final VerificationMeta _titreMeta = const VerificationMeta('titre');
  GeneratedTextColumn _titre;
  @override
  GeneratedTextColumn get titre => _titre ??= _constructTitre();
  GeneratedTextColumn _constructTitre() {
    return GeneratedTextColumn('titre', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn('description', $tableName, false,
        minTextLength: 1, maxTextLength: 50);
  }

  final VerificationMeta _dateMeta = const VerificationMeta('date');
  GeneratedDateTimeColumn _date;
  @override
  GeneratedDateTimeColumn get date => _date ??= _constructDate();
  GeneratedDateTimeColumn _constructDate() {
    return GeneratedDateTimeColumn(
      'date',
      $tableName,
      true,
    );
  }

  final VerificationMeta _etatMeta = const VerificationMeta('etat');
  GeneratedBoolColumn _etat;
  @override
  GeneratedBoolColumn get etat => _etat ??= _constructEtat();
  GeneratedBoolColumn _constructEtat() {
    return GeneratedBoolColumn('etat', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns => [titre, description, date, etat];
  @override
  $NoteTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'note';
  @override
  final String actualTableName = 'note';
  @override
  VerificationContext validateIntegrity(Insertable<NoteData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('titre')) {
      context.handle(
          _titreMeta, titre.isAcceptableOrUnknown(data['titre'], _titreMeta));
    } else if (isInserting) {
      context.missing(_titreMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date'], _dateMeta));
    }
    if (data.containsKey('etat')) {
      context.handle(
          _etatMeta, etat.isAcceptableOrUnknown(data['etat'], _etatMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  NoteData map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return NoteData.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $NoteTable createAlias(String alias) {
    return $NoteTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $NoteTable _note;
  $NoteTable get note => _note ??= $NoteTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [note];
}
