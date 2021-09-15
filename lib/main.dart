import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  // Ensure Flutter it is initialized before initialize the Firebase.
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  // Load remote keys from Firebase.
  RemoteConfig.instance.fetchAndActivate();

  runApp(
    GetMaterialApp(
      title: 'Application',
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
