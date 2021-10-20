abstract class HomePageState {}

class HomePageSucess implements HomePageState {
  final String data;
  const HomePageSucess(this.data);
}

class HomePageLoading implements HomePageState {
  const HomePageLoading();
}

class HomePageError implements HomePageState {
  final String message;

  const HomePageError(this.message);
}
