import 'package:flutter/material.dart';
import 'package:progmsn2024/models/moviesdao.dart';

class MovieViewItemFirebase extends StatefulWidget {
  MovieViewItemFirebase({super.key, required this.moviesDAO});

  MoviesDAO moviesDAO;

  @override
  State<MovieViewItemFirebase> createState() => _MovieViewItemFirebaseState();
}

class _MovieViewItemFirebaseState extends State<MovieViewItemFirebase> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.moviesDAO.imgMovie!),
    );
  }
}
