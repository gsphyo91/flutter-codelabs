import 'package:flutter/material.dart';
import 'package:flutter_codelab/getX/signin/signin.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  // Codelabs: Adding WebView to your Flutter App
  // runApp(const MaterialApp(
  //   home: WebViewApp(),
  // ));

  // Coobook
  // Animation a page route transition
  // runApp(const MaterialApp(
  //   home: Page1(),
  // ));

  // Anamate a widget using a physics simulation
  // runApp(const MaterialApp(home: PhysicsCardDragDemo()));

  // GetX
  // Counter App
  // runApp(const GetMaterialApp(home: Home()));

  // Signin Form
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      // theme: ThemeData(
      //   appBarTheme: const AppBarTheme(
      //     systemOverlayStyle: SystemUiOverlayStyle(
      //       statusBarBrightness: Brightness.light,
      //       statusBarIconBrightness: Brightness.light,
      //       statusBarColor: Colors.black,
      //       systemNavigationBarColor: Colors.white,
      //       systemNavigationBarIconBrightness: Brightness.light,
      //     ),
      //   ),
      // ),
      home: Signin(),
    ),
  );
}
