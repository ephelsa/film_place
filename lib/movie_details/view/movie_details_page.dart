import 'package:flutter/material.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage(this.movieId, {Key? key}) : super(key: key);

  static Route<void> route({required int movieId}) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => MovieDetailsPage(movieId),
    );
  }

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.purple,
          child: Text('MovieID: $movieId'),
        ),
      ),
    );
  }
}
