import 'package:flutter_test/flutter_test.dart';
import 'package:poc_imc/controller/controller_imc.dart';

void main() {
  ViewController controller = ViewController();
  test('deve retornar false se o peso estiver vazio',
      () => {expect(controller.callIMCTable(), '')});

  test('deve retornar 0.0 se altura e peso for vazio',
      () => {expect(controller.callIMCResult(), 0.0)});
}
//campos só com 0000 no preenchimento
//