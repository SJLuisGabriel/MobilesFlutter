import 'package:flutter/material.dart';
import 'package:progmsn2024/firebase/database_movie.dart';
import 'package:progmsn2024/models/moviesdao.dart';
import 'package:progmsn2024/views/movie_view_firebase.dart';
import 'package:progmsn2024/views/movie_view_item_firebase.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class MoviesFirebaseScreen extends StatefulWidget {
  const MoviesFirebaseScreen({super.key});

  @override
  State<MoviesFirebaseScreen> createState() => _MoviesFirebaseScreenState();
}

class _MoviesFirebaseScreenState extends State<MoviesFirebaseScreen> {
  DatabaseMovie? databaseMovie;
  @override
  void initState() {
    databaseMovie = DatabaseMovie();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies_list'),
        actions: [
          IconButton(
            onPressed: () {
              WoltModalSheet.show(
                context: context,
                pageListBuilder: (context) => [
                  WoltModalSheetPage(
                    child: NewMovieViewFirebase(),
                  )
                ],
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: StreamBuilder(
          stream: databaseMovie!.select(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return MovieViewItemFirebase(
                    moviesDAO: MoviesDAO.fromMap({
                      'id': '${snapshot.data!.docs[index].id}',
                      'imgMovie':
                          '${snapshot.data!.docs[index].get('imgMovie')}',
                      'nameMovie':
                          '${snapshot.data!.docs[index].get('nameMovie')}',
                      'overview':
                          '${snapshot.data!.docs[index].get('overview')}',
                      'releaseDate':
                          '${snapshot.data!.docs[index].get('releaseDate')}'
                    }),
                  );

                  // Image.network(
                  //     snapshot.data!.docs[index].get('imgMovie'));
                },
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Ocurrio un error"),
              );
            } else {
              return const Center();
            }
          }),
    );
  }
}
