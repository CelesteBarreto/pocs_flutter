import 'package:cpf_validation/controllers/cpf_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('deve retornar true para cpf correto', () {
    final cpfController = CPFController();
    final value = cpfController.checkValue('12478285738');
    expect(value, true);
  });

  test('deve retornar false para cpf incorreto', () {
    final cpfController = CPFController();
    final value = cpfController.checkValue('12478285757');
    expect(value, false);
  });

  test('deve retornar false se o cpf estiver vazio', () {
    final cpfController = CPFController();
    final value = cpfController.checkValue('');
    expect(value, false);
  });

  test('deve retornar false se o cpf tiver algo que não for número', () {
    final cpfController = CPFController();
    final value = cpfController.checkValue('124635324534e');
    expect(value, false);
  });

  test('deve retornar false se o cpf for maior que 11', () {
    final cpfController = CPFController();
    final value = cpfController.checkValue('1278427637646726348726');
    expect(value, false);
  });

  test('deve retornar false se o cpf for menor que 11', () {
    final cpfController = CPFController();
    final value = cpfController.checkValue('13424');
    expect(value, false);
  });
}
