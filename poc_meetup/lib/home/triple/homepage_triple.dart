import 'package:flutter/material.dart';
import 'package:poc_meetup/home/triple/homepage_store.dart';
import 'package:poc_meetup/home/triple/typed_text_state.dart';
import 'package:flutter_triple/flutter_triple.dart';

class MyHomePageTriple extends StatefulWidget {
  const MyHomePageTriple({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePageTriple> createState() => _MyHomePageTripleState();
}

class _MyHomePageTripleState extends State<MyHomePageTriple> {
  final homeStore = HomePageStore();
  String typedText = '';
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
            ScopedBuilder<HomePageStore, HomePageError, HomePageSucess>(
              store: homeStore,
              onError: (context, HomePageError? e) => Text('$e.message'),
              onState: (context, HomePageSucess state) =>
                  state.data.isEmpty ? Container() : Text(state.data),
              onLoading: (context) => const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(fixedSize: const Size(350, 30)),
        onPressed: () {
          formKey.currentState!.save();
          homeStore.typedTextRetrieved(typedText);
        },
        child: const Text('Submit'),
      ),
    );
  }
}
