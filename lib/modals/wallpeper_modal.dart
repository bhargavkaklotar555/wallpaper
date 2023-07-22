class Wallpeper {
  final String largeImageURL;

  Wallpeper({
    required this.largeImageURL,
  });

  factory Wallpeper.fromMap({required Map data}) {
    return Wallpeper(
      largeImageURL: data['largeImageURL'],
    );
  }
}
