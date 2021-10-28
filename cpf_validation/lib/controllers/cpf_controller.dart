import 'package:string_validator/string_validator.dart' as validator;

class CPFController {
  late bool equal;
  int increment = 0;
  int decrementMult1 = 10;
  int decrementMult2 = 11;
  int lastValueDigitOne = 0;
  int lastValueDigitTwo = 0;
  int valueCheckDigitOne = 0;
  int valueCheckDigitTwo = 0;

  checaPrimeiroDigito(List<String> text) {
    for (var index in text) {
      while (increment <= 8) {
        lastValueDigitOne =
            lastValueDigitOne + (int.parse(index[increment]) * decrementMult1);
        increment = increment + 1;
        if (decrementMult1 >= 2) {
          decrementMult1 = decrementMult1 - 1;
        }
      }
      valueCheckDigitOne = int.parse(index[9]);
      increment = 0;
    }
    lastValueDigitOne = (lastValueDigitOne * 10) % 11;
    return lastValueDigitOne;
  }

  checarSegundoDigito(List<String> text) {
    for (var index in text) {
      while (increment <= 9) {
        lastValueDigitTwo =
            lastValueDigitTwo + (int.parse(index[increment]) * decrementMult2);
        increment = increment + 1;
        if (decrementMult2 >= 2) {
          decrementMult2 = decrementMult2 - 1;
        }
      }
      valueCheckDigitTwo = int.parse(index[10]);
      increment = 0;
    }
    lastValueDigitTwo = (lastValueDigitTwo * 10) % 11;
    return lastValueDigitTwo;
  }

  checkValue(String cpf) {
    if (cpf.isEmpty) {
      return false;
    } else {
      if (!validator.isNumeric(cpf)) {
        return false;
      } else if (cpf.length != 11) {
        return false;
      } else {
        List<String> text = cpf.split(',');
        checaPrimeiroDigito(text);
        checarSegundoDigito(text);
        if (valueCheckDigitTwo == lastValueDigitTwo &&
            valueCheckDigitOne == lastValueDigitOne) {
          equal = true;
        } else {
          equal = false;
        }
        return equal;
      }
    }
  }
}
