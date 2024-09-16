class MoviesDAO {
  int? idMovie;
  String? nameMovie;
  String? overViewMovie;
  String? idGenre;
  String? imgMovie;
  String? releaseData;

  MoviesDAO(
      {this.idMovie,
      this.nameMovie,
      this.overViewMovie,
      this.idGenre,
      this.imgMovie,
      this.releaseData});

  factory MoviesDAO.fromMap(Map<String, dynamic> movie) {
    return MoviesDAO(
        idGenre: movie['idGenre'],
        idMovie: movie['idMovie'],
        imgMovie: movie['imgMovie'],
        nameMovie: movie['nameMovie'],
        overViewMovie: movie['overViewMovie'],
        releaseData: movie['releaseData']);
  }
}
