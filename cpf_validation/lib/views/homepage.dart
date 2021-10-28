import 'package:cpf_validation/controllers/cpf_controller.dart';
import 'package:cpf_validation/views/custom_textformfield.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>();
  String? streetText;

  TextEditingController textController = TextEditingController();
  CPFController cpfController = CPFController();

  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CPF Validator"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormFieldClass(
                    text: 'CPF',
                    controller: textController,
                    onChanged: () {},
                    validator: (value) {
                      if (value!.isEmpty || value.length < 11) {
                        return 'Preencha o campo corretamente';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            Future.delayed(const Duration(milliseconds: 2));
                            cpfController.checkValue(textController.text);
                          }
                        },
                        child: const Text('Salvar')),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
