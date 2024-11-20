import 'package:flutter/material.dart';
import 'package:progmsn2024/models/popular_moviedao.dart';
import 'package:progmsn2024/network/popular_api.dart';
import 'package:progmsn2024/provider/test_provider.dart';
import 'package:provider/provider.dart';

class FavoritesPopular extends StatefulWidget {
  const FavoritesPopular({super.key});

  @override
  State<FavoritesPopular> createState() => _FavoritesPopularState();
}

class _FavoritesPopularState extends State<FavoritesPopular> {
  PopularApi? popularApi;

  @override
  void initState() {
    super.initState();
    popularApi = PopularApi();
  }

  @override
  Widget build(BuildContext context) {
    final testProvider = Provider.of<TestProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorites'),
      ),
      body: FutureBuilder<List<PopularMovieDao>>(
        future: popularApi!.getPopularMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Filtrar las películas favoritas
            final favoriteMovies = testProvider.favoriteMovies;
            final filteredMovies = snapshot.data!.where((movie) {
              return favoriteMovies.any((favorite) => favorite.id == movie.id);
            }).toList();

            if (filteredMovies.isNotEmpty) {
              return GridView.builder(
                itemCount: filteredMovies.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .7,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return cardPopular(filteredMovies[index]);
                },
              );
            } else {
              return const Center(child: Text('No favorite movies found.'));
            }
          } else {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
        },
      ),
    );
  }

  Widget cardPopular(PopularMovieDao popular) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/details', arguments: popular),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500/${popular.posterPath}'),
            ),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Opacity(
                opacity: .7,
                child: Container(
                  child: Center(
                    child: Text(
                      popular.title,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  color: Colors.black,
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
