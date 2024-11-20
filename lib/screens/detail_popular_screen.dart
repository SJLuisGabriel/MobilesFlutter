import 'package:flutter/material.dart';
import 'package:progmsn2024/models/popular_moviedao.dart';
import 'package:progmsn2024/models/actor.dart';
import 'package:progmsn2024/network/popular_api.dart';
import 'package:progmsn2024/provider/test_provider.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailPopularScreen extends StatefulWidget {
  const DetailPopularScreen({super.key});

  @override
  State<DetailPopularScreen> createState() => _DetailPopularScreenState();
}

class _DetailPopularScreenState extends State<DetailPopularScreen> {
  YoutubePlayerController? _controller;
  bool _isVideoLoading = false; // Indica si el video está cargando

  @override
  void initState() {
    super.initState();
    _controller = null;
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _playVideo(String videoKey) {
    setState(() {
      _isVideoLoading = true; // Muestra el indicador de carga
      _controller = YoutubePlayerController(
        initialVideoId: videoKey,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      );
    });

    // Simula un tiempo de carga
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isVideoLoading = false; // Oculta el indicador de carga
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final popular =
        ModalRoute.of(context)!.settings.arguments as PopularMovieDao;
    final testProvider = Provider.of<TestProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(popular.title),
        actions: [
          IconButton(
            icon: Icon(
              testProvider.isFavorite(popular.id)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () {
              testProvider.toggleFavorite(popular.id, popular.title);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Fondo de la pantalla con la imagen difuminada
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                opacity: .3,
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/w500/${popular.posterPath}'),
              ),
            ),
          ),
          // Contenedor para la descripción de la película
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: const BoxDecoration(
              color: Colors.black54, // Fondo semi-transparente
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    popular.title,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Description:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    popular.overview,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Release Date: ${popular.releaseDate}',
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  // Botón para reproducir el tráiler
                  ElevatedButton(
                    onPressed: () {
                      if (popular.videos.isNotEmpty) {
                        _playVideo(popular.videos[0].key);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Video no disponible o Sin video'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    child: const Text('Ver Trailer'),
                  ),

                  if (_controller != null) ...[
                    if (_isVideoLoading)
                      const Center(
                          child:
                              CircularProgressIndicator()), // Indicador de carga
                    YoutubePlayer(
                      controller: _controller!,
                      showVideoProgressIndicator: true,
                      bottomActions: [
                        const CurrentPosition(),
                        const ProgressBar(isExpanded: true),
                        const PlaybackSpeedButton(),
                        IconButton(
                          icon: Icon(
                            _controller!.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                          ),
                          onPressed: () {
                            setState(() {
                              _controller!.value.isPlaying
                                  ? _controller!.pause()
                                  : _controller!.play();
                            });
                          },
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ],
                  const SizedBox(height: 20),
                  // Aquí agregamos el widget de rating con estrellas
                  Row(
                    children: [
                      const Text('Rating:',
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      const SizedBox(width: 10),
                      buildRatingStars(popular.voteAverage),
                      const SizedBox(width: 5),
                      Text(
                        '${popular.voteAverage}/10',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Sección para los actores
                  const Text(
                    'Actors:',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  FutureBuilder<List<Actor>>(
                    future: fetchActors(popular.id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}',
                            style: const TextStyle(color: Colors.white));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Text('No actors found',
                            style: TextStyle(color: Colors.white));
                      }

                      final actors = snapshot.data!;
                      return Column(
                        children: actors.map((actor) {
                          return ListTile(
                            title: Text(actor.name,
                                style: const TextStyle(color: Colors.white)),
                            subtitle: Text('as ${actor.character}',
                                style: const TextStyle(color: Colors.grey)),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<List<Actor>> fetchActors(int movieId) async {
    final popularApi = PopularApi();
    return await popularApi.getActors(movieId);
  }

  Widget buildRatingStars(double rating) {
    int fullStars = rating ~/ 2;
    int halfStars = (rating % 2 >= 1) ? 1 : 0;
    int emptyStars = 5 - fullStars - halfStars;

    return Row(
      children: [
        for (int i = 0; i < fullStars; i++) ...[
          const Icon(Icons.star, color: Colors.yellow)
        ],
        for (int i = 0; i < halfStars; i++) ...[
          const Icon(Icons.star_half, color: Colors.yellow)
        ],
        for (int i = 0; i < emptyStars; i++) ...[
          const Icon(Icons.star_border, color: Colors.yellow)
        ],
      ],
    );
  }
}
