import 'package:flutter/material.dart';
import 'package:progmsn2024/database/movies_database.dart';
import 'package:progmsn2024/models/moviesdao.dart';
import 'package:progmsn2024/views/movie_view.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late MoviesDatabase moviesDB;

  @override
  void initState() {
    super.initState();
    moviesDB = MoviesDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies List'),
        actions: [
          IconButton(
              onPressed: () {
                WoltModalSheet.show(
                    context: context,
                    pageListBuilder: (context) =>
                        [WoltModalSheetPage(child: MovieView())]);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
          future: moviesDB.SELECT(),
          builder: (context, AsyncSnapshot<List<MoviesDAO>?> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Text(
                      'HOla'); //MovieViewItem(moviesDAO: snapshot.data![index],);
                },
              );
            } else {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
          }),
    );
  }
}
