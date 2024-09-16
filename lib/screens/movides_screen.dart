import 'package:flutter/material.dart';
import 'package:progmsn2024/database/movies_database.dart';
import 'package:progmsn2024/models/moviesdao.dart';

class MovidesScreen extends StatefulWidget {
  const MovidesScreen({super.key});

  @override
  State<MovidesScreen> createState() => _MovidesScreenState();
}

class _MovidesScreenState extends State<MovidesScreen> {
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
        title: Text('Movie List'),
      ),
      body: FutureBuilder(
          future: moviesDB.SELECT(),
          builder: (context, AsyncSnapshot<List<MoviesDAO>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  // return MovieViewItem(
                  //   MoviesDAO: snapshot.data![index],
                  // );
                },
              );
            } else {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Something was wrong! :)'),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
          }),
    );
  }

  // Widget MovieViewItem() {
  //   return Text('Movie List');
  // }
}
