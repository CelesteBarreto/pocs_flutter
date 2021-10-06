/* import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String typedText = '';
  bool hasSubmitted = false;
  //access the form
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                SizedBox(
                  width: 200,
                  child: Form(
                    key: formKey,
                    child: TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Company Name:'),
                      onSaved: (value) {
                        if (value != null) typedText = value;
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
            if (hasSubmitted)
              Text(
                'Feliz em estar aqui com a empresa $typedText',
                style: const TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(fixedSize: const Size(350, 30)),
        onPressed: () {
          formKey.currentState!.save();

          setState(() {
            hasSubmitted = true;
          });
        },
        child: const Text('Submit'),
      ),
    );
  }
}
 */