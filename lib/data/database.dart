import 'dart:async';
import 'package:floor/floor.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:calculator/data/dao/calculation_dao.dart';
import 'package:calculator/data/models/calculation.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Calculation])
abstract class AppDatabase extends FloorDatabase {
  CalculationDao get calculationDao;
}