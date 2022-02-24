import 'package:drift/drift.dart';

import '../database.dart';

part 'locations_dao.g.dart';

// the _TodosDaoMixin will be created by drift. It contains all the necessary
// fields for the tables. The <MyDatabase> type annotation is the database class
// that should use this dao.
@DriftAccessor(tables: [Locations])
class LocationsDao extends DatabaseAccessor<AppDatabase>
    with _$LocationsDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  LocationsDao(AppDatabase db) : super(db);

  Future<List<Location>> getAllLocations() => select(locations).get();

  //获取最大
  Future<List<Location>> getDescLocations() {
    return (select(locations)
          ..orderBy(
              [(u) => OrderingTerm(expression: u.id, mode: OrderingMode.desc)])
          ..limit(1))
        .get();
  }

  Stream<List<Location>> watchAllLocations() => select(locations).watch();

  Future insertLocation(LocationsCompanion locationsCompanion) =>
      into(locations).insert(locationsCompanion);

  Future updateLocation(Location location) {
    return update(locations).replace(location);
  }

  Future deleteLocation(Location location) =>
      delete(locations).delete(location);
}
