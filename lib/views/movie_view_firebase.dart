import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:progmsn2024/firebase/database_movie.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:progmsn2024/models/moviesdao.dart';
import 'package:progmsn2024/settings/global_values.dart';

class NewMovieViewFirebase extends StatefulWidget {
  NewMovieViewFirebase({super.key, this.moviesDAO});

  MoviesDAO? moviesDAO;

  @override
  State<NewMovieViewFirebase> createState() => _MovieViewState();
}

class _MovieViewState extends State<NewMovieViewFirebase> {
  TextEditingController conName = TextEditingController();
  TextEditingController conOverview = TextEditingController();
  TextEditingController conImgMovie = TextEditingController();
  TextEditingController conRelease = TextEditingController();
  DatabaseMovie? dbMovies;

  @override
  void initState() {
    super.initState();
    dbMovies = DatabaseMovie();

    if (widget.moviesDAO != null) {
      conName.text = widget.moviesDAO!.nameMovie!;
      conOverview.text = widget.moviesDAO!.overView!;
      conImgMovie.text = widget.moviesDAO!.imgMovie!;
      conRelease.text = widget.moviesDAO!.releaseData!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final txtNameMovie = TextFormField(
      controller: conName,
      decoration: const InputDecoration(hintText: 'Nombre de la película'),
    );
    final txtOverview = TextFormField(
      controller: conOverview,
      maxLines: 5,
      decoration: const InputDecoration(hintText: 'Sinapsis de la película'),
    );
    final txtImgMovie = TextFormField(
      controller: conImgMovie,
      decoration: const InputDecoration(hintText: 'Poster de la película'),
    );
    final txtRelease = TextFormField(
      readOnly: true,
      controller: conRelease,
      decoration: const InputDecoration(hintText: 'Fecha de lanzamiento'),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2024),
            lastDate: DateTime(2050));

        if (pickedDate != null) {
          String formatDate = DateFormat('dd-MM-yyyy').format(pickedDate);
          conRelease.text = formatDate;
          setState(() {});
        }
      },
    );

    final btnSave = ElevatedButton(
      onPressed: () {
        if (widget.moviesDAO == null) {
          dbMovies!.insert({
            "nameMovie": conName.text,
            "overview": conOverview.text,
            "imgMovie": conImgMovie.text,
            "releaseDate": conRelease.text
          }).then((value) {
            if (value) {
              GlobalValues.banUpdListMovies.value =
                  !GlobalValues.banUpdListMovies.value;
              return QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                text: 'Transaction Completed Successfully!',
                autoCloseDuration: const Duration(seconds: 2),
                showConfirmBtn: false,
              );
            } else {
              return QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                text: 'Something was wrong! :()',
                autoCloseDuration: const Duration(seconds: 2),
                showConfirmBtn: false,
              );
            }
          });
        }
        // else {
        //   dbMovies!.update( {
        //     "idMovie": widget.moviesDAO!.idMovie,
        //     "nameMovie": conName.text,
        //     "overview": conOverview.text,
        //     "imgMovie": conImgMovie.text,
        //     "releaseDate": conRelease.text
        //   }).then((value) {
        //     final msj;
        //     QuickAlertType type = QuickAlertType.success;
        //     if (value > 0) {
        //       GlobalValues.banUpdListMovies.value =
        //           !GlobalValues.banUpdListMovies.value;
        //       type = QuickAlertType.success;
        //       msj = 'Transaction Completed Successfully!';
        //     } else {
        //       type = QuickAlertType.error;
        //       msj = 'Something was wrong! :()';
        //     }
        //     return QuickAlert.show(
        //       context: context,
        //       type: type,
        //       text: msj,
        //       autoCloseDuration: const Duration(seconds: 2),
        //       showConfirmBtn: false,
        //     );
        //   });
        // }
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[200]),
      child: const Text('Guardar'),
    );

    return ListView(
      padding: EdgeInsets.all(10),
      shrinkWrap: true,
      children: [txtNameMovie, txtOverview, txtImgMovie, txtRelease, btnSave],
    );
  }
}
