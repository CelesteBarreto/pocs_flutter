import 'package:flutter_triple/flutter_triple.dart';
import 'package:poc_meetup/home/triple/typed_text_state.dart';

class HomePageStore extends StreamStore<HomePageError, HomePageSucess> {
  HomePageStore() : super(const HomePageSucess(''));

  Future<String?> typedTextRetrieved(String text) async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 5));
    if (text.isNotEmpty) {
      try {
        update(HomePageSucess(text), force: true);
        setLoading(false);
      } catch (e) {
        setError(const HomePageError('erro'));
      }
    }
  }
}
