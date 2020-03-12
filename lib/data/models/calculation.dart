
import 'package:floor/floor.dart';

@Entity(tableName: 'calculations')
class Calculation {
  @PrimaryKey(autoGenerate: true)
  int id;
  
  final String equation;
  final String result;

  Calculation(this.equation, this.result);
}