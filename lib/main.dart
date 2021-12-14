import 'package:flutter/material.dart';
import 'package:flutter_codelab/getX/couter_app/home.dart';
import 'package:get/get.dart';

void main() {
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
  runApp(const GetMaterialApp(home: Home()));
}
