import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/movies_controller.dart';

class MoviesView extends GetView<MoviesController> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'MoviesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
