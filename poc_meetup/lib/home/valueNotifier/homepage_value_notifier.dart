import 'package:flutter/material.dart';
import 'package:poc_meetup/home/valueNotifier/notifier_controller.dart';

class MyHomePageValueNotifier extends StatefulWidget {
  final String title;
  const MyHomePageValueNotifier({Key? key, required this.title})
      : super(key: key);

  @override
  _MyHomePageValueNotifierState createState() =>
      _MyHomePageValueNotifierState();
}

class _MyHomePageValueNotifierState extends State<MyHomePageValueNotifier> {
  ValueNotifierController notifierController = ValueNotifierController();

  @override
  void dispose() {
    notifierController.disposeController();
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
              child: ValueListenableBuilder(
                valueListenable: notifierController.text,
                builder:
                    (BuildContext context, String typedText, Widget? child) {
                  return Column(
                    children: [
                      TextFormField(
                          controller: notifierController.myTextController,
                          decoration: const InputDecoration(
                              labelText: 'Company Name: ')),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        'Feliz em estar aqui com a empresa $typedText',
                        style: const TextStyle(fontSize: 18),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(fixedSize: const Size(350, 30)),
          onPressed: () {
            notifierController.updateText();
          },
          child: const Text('Submit')),
    );
  }
}
