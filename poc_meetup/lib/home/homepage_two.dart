import 'package:flutter/material.dart';
import 'package:poc_meetup/home/homepage_controller.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomePageController homePageController = HomePageController();

  @override
  void dispose() {
    homePageController.disposeController();
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
                valueListenable: homePageController.text,
                builder:
                    (BuildContext context, String typedText, Widget? child) {
                  return Column(
                    children: [
                      TextFormField(
                          controller: homePageController.myTextController,
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
            homePageController.updateText();
          },
          child: const Text('Submit')),
    );
  }
}
