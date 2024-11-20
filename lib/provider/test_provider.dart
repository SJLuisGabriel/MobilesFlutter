import 'package:flutter/material.dart';

class FavoriteMovie {
  final int id;
  final String title;

  FavoriteMovie(this.id, this.title);
}

class TestProvider extends ChangeNotifier {
  String _name = 'Luis Gabriel Sanchez Jungo';
  List<FavoriteMovie> _favoriteMovies =
      []; // Lista para almacenar películas favoritas

  String get name => _name;

  set name(String value) {
    _name = value;
    notifyListeners();
  }

  List<FavoriteMovie> get favoriteMovies =>
      _favoriteMovies; // Getter para la lista de favoritos

  // Método para verificar si una película es favorita
  bool isFavorite(int movieId) {
    return _favoriteMovies.any((movie) => movie.id == movieId);
  }

  // Método para alternar el estado de favorito
  void toggleFavorite(int movieId, String title) {
    if (isFavorite(movieId)) {
      _favoriteMovies.removeWhere((movie) => movie.id == movieId);
      print("Removed from favorites: $movieId");
    } else {
      _favoriteMovies.add(FavoriteMovie(movieId, title));
      print("Added to favorites: $movieId");
    }
    notifyListeners();
    // printFavoriteMovies(); // Imprimir lista de favoritos
  }

  // Método para imprimir los favoritos en la consola
  // void printFavoriteMovies() {
  //   if (_favoriteMovies.isNotEmpty) {
  //     print("Favorite Movies:");
  //     _favoriteMovies.forEach((movie) {
  //       print("ID: ${movie.id}, Title: ${movie.title}");
  //     });
  //   } else {
  //     print("No favorite movies yet.");
  //   }
  // }
}
