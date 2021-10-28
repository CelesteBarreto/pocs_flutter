import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController peso = TextEditingController();
  TextEditingController altura = TextEditingController();
  double imc = 0.0;
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC calculator'),
      ),
      body: GestureDetector(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: peso,
                      decoration: InputDecoration(
                        labelText: 'Peso',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: altura,
                      decoration: const InputDecoration(
                          labelText: 'Altura', border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                        'IMC: ${imc.toStringAsFixed(1)} , Resultado:  $result'),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                        width: 200,
                        child: ElevatedButton.icon(
                            onPressed: () {
                              imc = double.parse(peso.text) /
                                  ((double.parse(altura.text)) *
                                      (double.parse(altura.text)));
                              setState(() {
                                calcIMC();
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

  calcIMC() {
    if (imc < 18.5) {
      result = 'magreza';
      return;
    } else if (imc >= 18.5 || imc <= 24.9) {
      result = 'normal';
    } else if (imc > 24.9 || imc <= 30) {
      result = 'sobrepeso';
    } else if (imc > 30) {
      result = 'obesidade';
    }
    return result;
  }
}
