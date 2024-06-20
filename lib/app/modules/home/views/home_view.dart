import 'package:awfarly/app/constants/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'WILL ADDED LETTER',
              style: h1Black,
            ),
          ),
        ),
      ),
    );
  }
}
