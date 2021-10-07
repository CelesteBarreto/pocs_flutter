/* import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController typeTextController = TextEditingController();
  final text = RxNotifier<String>('');
  String get textChanges => text.value;
  set textChanges(String typedText) => text.value = typedText;

  @override
  void initState() {
    rxObserver(() => print(textChanges));
    super.initState();
  }

  @override
  void dispose() {
    typeTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 200,
                child: Column(
                  children: [
                    TextFormField(
                        controller: typeTextController,
                        decoration:
                            const InputDecoration(labelText: 'Company Name: ')),
                    const SizedBox(
                      height: 40,
                    ),
                    RxBuilder(
                        builder: (context) {
                          return Text(
                            'Feliz em estar aqui com a empresa $textChanges',
                            style: const TextStyle(fontSize: 18),
                          );
                        },
                        filter: () => textChanges != ''),
                  ],
                )),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(fixedSize: const Size(350, 30)),
          onPressed: () {
            text.value = typeTextController.text;
          },
          child: const Text('Submit')),
    );
  }
}
 */