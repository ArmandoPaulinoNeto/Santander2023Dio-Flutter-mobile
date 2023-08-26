import 'dart:io';
import 'package:bmi_calculator_console/src/services/calculator_service.dart';
import 'entities/person.dart';

void main(List<String> args) {
  
  CalculatorService calc_Service = CalculatorService();

  try {
    print("Digite o seu nome: ");
    String name = stdin.readLineSync()!;
    print("Digite o seu peso: ");
    double weight = double.parse(stdin.readLineSync()!);
    print("Digite a sua altura: ");
    double height = double.parse(stdin.readLineSync()!);
    Person person = Person(name, weight, height);

    double bmi = calc_Service.calculateBMI(weight, height);

    print(person);

    print("IMC: ${bmi.toStringAsFixed(2)}\nResultado: ${calc_Service.resultBMI(bmi)}");
  } on Exception catch (e) {
    print("Ocorreu uma falha ao capturar seus dados.");
  }
}
