import 'dart:math';

import 'package:bmi_calculator_console/src/entities/person.dart';
import 'package:bmi_calculator_console/src/repositories/person_repository.dart';
import 'package:bmi_calculator_console/src/services/calculator_service.dart' as calc_servece;
import 'package:test/test.dart';

void main() {
  group('calculator_bmi', () {

    PersonRepository personRepository = PersonRepository();
    var dataPeople = personRepository.consultData();

    dataPeople.forEach((key, value) {
      Person person = Person(key, double.parse(value['weight'].toString()), double.parse(value['height'].toString()));
      var exp = value['expect'].toString();
      var bmi = calc_servece.CalculatorService().calculateBMI(person.weight, person.height);
      var result = calc_servece.CalculatorService().resultBMI(bmi);
      test("IMC de ${person.name} foi: ${bmi.toStringAsFixed(2)}\n\t--> Esperado: $exp X Resultado: $result", () {
        expect(result, exp);
      });
    });
  });
}
