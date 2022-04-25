import 'package:flutter/material.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({Key? key}) : super(key: key);

  static Route<void> route({required int movieId}) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => const MovieDetailsPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.purple,
          child: const Text('Movie Details page'),
        ),
      ),
    );
  }
}
