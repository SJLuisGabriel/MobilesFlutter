class MoviesDAO {
  int? idMovie;
  String? nameMovie;
  String? overView;
  // String? idGenre;
  String? imgMovie;
  String? releaseData;

  MoviesDAO(
      {this.idMovie,
      this.nameMovie,
      this.overView,
      // this.idGenre,
      this.imgMovie,
      this.releaseData});

  factory MoviesDAO.fromMap(Map<String, dynamic> movie) {
    return MoviesDAO(
        // idGenre: movie['idGenre'],
        idMovie: movie['idMovie'],
        imgMovie: movie['imgMovie'],
        nameMovie: movie['nameMovie'],
        overView: movie['overView'],
        releaseData: movie['releaseData']);
  }
}
