class ModelIMC {
  double peso;
  double altura;

  ModelIMC({required this.peso, required this.altura});

  double calcIMC() {
    double imc = peso / (altura * altura);
    return imc;
  }

  String checkIMCTable() {
    double imc = calcIMC();
    String result = '';
    if (imc < 18.5) {
      result = 'magreza';
    } else if (imc >= 18.5 && imc <= 24.9) {
      result = 'normal';
    } else if (imc > 24.9 && imc <= 30) {
      result = 'sobrepeso';
    } else if (imc > 30) {
      result = 'obesidade';
    }
    return result;
  }
}
