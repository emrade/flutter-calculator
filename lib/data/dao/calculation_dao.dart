import 'package:calculator/data/models/calculation.dart';
import 'package:floor/floor.dart';

@dao
abstract class CalculationDao {
  @Query('SELECT * FROM calculations')
  Future<List<Calculation>> index();

  @Query('SELECT * FROM calculations')
  Stream<List<Calculation>> indexStream();

  @insert
  Future<void> save(Calculation calculation);

  @Query('DELETE FROM calculations')
  Future<void> clear();
}
