import 'package:poc_imc/model/model_imc.dart';

class ViewController {
  String peso = '';
  String altura = '';
  static ViewController instance = ViewController();
  double parsePeso = 0.0;
  double parseAltura = 0.0;

  callIMCTable() {
    if (altura.isEmpty && peso.isEmpty) {
      return '';
    } else {
      parsePeso = double.parse(peso);
      parseAltura = double.parse(altura);
      ModelIMC model = ModelIMC(altura: parseAltura, peso: parsePeso);
      String result = model.checkIMCTable();
      return result;
    }
  }

  callIMCResult() {
    if (altura.isEmpty && peso.isEmpty) {
      return 0.0;
    } else {
      parsePeso = double.parse(peso);
      parseAltura = double.parse(altura);
    }
    ModelIMC model = ModelIMC(altura: parseAltura, peso: parsePeso);
    double calc = model.calcIMC();
    return calc.toStringAsFixed(1);
  }
}
