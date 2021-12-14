import 'package:flutter/material.dart';
import 'package:flutter_codelab/codelabs/webview/webview_in_flutter.dart';
import 'package:flutter_codelab/cookbook/animation/page-route-transition/page1.dart';
import 'package:flutter_codelab/cookbook/animation/physics-animation/physics_card_drag.dart';

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
  runApp(const MaterialApp(home: PhysicsCardDragDemo()));
}
