// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Location extends DataClass implements Insertable<Location> {
  final int? id;
  final String city;
  final String? area;
  Location({this.id, required this.city, this.area});
  factory Location.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Location(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}id']),
      city: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}city'])!,
      area: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}area']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int?>(id);
    }
    map['city'] = Variable<String>(city);
    if (!nullToAbsent || area != null) {
      map['area'] = Variable<String?>(area);
    }
    return map;
  }

  LocationsCompanion toCompanion(bool nullToAbsent) {
    return LocationsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      city: Value(city),
      area: area == null && nullToAbsent ? const Value.absent() : Value(area),
    );
  }

  factory Location.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Location(
      id: serializer.fromJson<int?>(json['id']),
      city: serializer.fromJson<String>(json['city']),
      area: serializer.fromJson<String?>(json['area']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'city': serializer.toJson<String>(city),
      'area': serializer.toJson<String?>(area),
    };
  }

  Location copyWith({int? id, String? city, String? area}) => Location(
        id: id ?? this.id,
        city: city ?? this.city,
        area: area ?? this.area,
      );
  @override
  String toString() {
    return (StringBuffer('Location(')
          ..write('id: $id, ')
          ..write('city: $city, ')
          ..write('area: $area')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, city, area);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Location &&
          other.id == this.id &&
          other.city == this.city &&
          other.area == this.area);
}

class LocationsCompanion extends UpdateCompanion<Location> {
  final Value<int?> id;
  final Value<String> city;
  final Value<String?> area;
  const LocationsCompanion({
    this.id = const Value.absent(),
    this.city = const Value.absent(),
    this.area = const Value.absent(),
  });
  LocationsCompanion.insert({
    this.id = const Value.absent(),
    required String city,
    this.area = const Value.absent(),
  }) : city = Value(city);
  static Insertable<Location> custom({
    Expression<int?>? id,
    Expression<String>? city,
    Expression<String?>? area,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (city != null) 'city': city,
      if (area != null) 'area': area,
    });
  }

  LocationsCompanion copyWith(
      {Value<int?>? id, Value<String>? city, Value<String?>? area}) {
    return LocationsCompanion(
      id: id ?? this.id,
      city: city ?? this.city,
      area: area ?? this.area,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int?>(id.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (area.present) {
      map['area'] = Variable<String?>(area.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocationsCompanion(')
          ..write('id: $id, ')
          ..write('city: $city, ')
          ..write('area: $area')
          ..write(')'))
        .toString();
  }
}

class $LocationsTable extends Locations
    with TableInfo<$LocationsTable, Location> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocationsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, true,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String?> city = GeneratedColumn<String?>(
      'city', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _areaMeta = const VerificationMeta('area');
  @override
  late final GeneratedColumn<String?> area = GeneratedColumn<String?>(
      'area', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, city, area];
  @override
  String get aliasedName => _alias ?? 'locations';
  @override
  String get actualTableName => 'locations';
  @override
  VerificationContext validateIntegrity(Insertable<Location> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('area')) {
      context.handle(
          _areaMeta, area.isAcceptableOrUnknown(data['area']!, _areaMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Location map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Location.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $LocationsTable createAlias(String alias) {
    return $LocationsTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $LocationsTable locations = $LocationsTable(this);
  late final LocationsDao locationsDao = LocationsDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [locations];
}
