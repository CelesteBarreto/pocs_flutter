class CPFController {
  late bool iguais;
  int itera = 0;
  int desitera1 = 10;
  int desitera2 = 11;
  int digito1 = 0;
  int digito2 = 0;
  int primeiroDigito = 0;
  int segundoDigito = 0;

  checaPrimeiroDigito(String cpf) {
    List<String> text = cpf.split(',');
    for (var index in text) {
      while (itera <= 8) {
        digito1 = digito1 + (int.parse(index[itera]) * desitera1);
        itera = itera + 1;
        if (desitera1 >= 2) {
          desitera1 = desitera1 - 1;
        }
      }
      primeiroDigito = int.parse(index[9]);
      itera = 0;
    }
    digito1 = (digito1 * 10) % 11;
    return digito1;
  }

  checarSegundoDigito(String cpf) {
    List<String> text = cpf.split(',');
    for (var index in text) {
      while (itera <= 9) {
        digito2 = digito2 + (int.parse(index[itera]) * desitera2);
        itera = itera + 1;
        if (desitera2 >= 2) {
          desitera2 = desitera2 - 1;
        }
      }
      segundoDigito = int.parse(index[10]);
      itera = 0;
    }
    digito2 = (digito2 * 10) % 11;
    return digito2;
  }

  checkValue(String cpf) {
    checaPrimeiroDigito(cpf);
    checarSegundoDigito(cpf);
    if (segundoDigito == digito2 && primeiroDigito == digito1) {
      iguais = true;
    }
  }
}
