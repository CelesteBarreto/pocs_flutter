import 'package:flutter/material.dart';
import 'package:poc_imc/components/custom_textformfield.dart';
import 'package:poc_imc/controller/controller_imc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = ViewController.instance;
  bool _visible = false;
  //não será mudada em nenhum momento
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('IMC calculator'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                        onChanged: (value) {
                          controller.peso = value;
                        },
                        text: 'Peso'),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                      onChanged: (value) {
                        controller.altura = value;
                      },
                      text: 'Altura',
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Visibility(
                      visible: _visible,
                      child: Text(
                          'IMC: ${controller.callIMCResult()} , Resultado: ${controller.callIMCTable()}'),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                        width: 200,
                        child: ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                controller.callIMCTable();
                                _visible = true;
                              });
                            },
                            icon: const Icon(Icons.calculate),
                            label: const Text('Calcular'))),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
