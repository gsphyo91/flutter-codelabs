import 'package:flutter/material.dart';
import 'package:flutter_codelab/getX/bottom_navigation/app.dart';
import 'package:flutter_codelab/getX/bottom_navigation/bottom_sheets.dart';
import 'package:flutter_codelab/getX/bottom_navigation/pages/home/details.dart';
import 'package:get/get.dart';

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
  // [Counter App]
  // runApp(const GetMaterialApp(home: Home()));

  // [Signin Form]
  // await GetStorage.init();
  // runApp(
  //   GetMaterialApp(
  //     home: Signin(),
  //   ),
  // );

  // [Bottom Sheets]
  runApp(
    GetMaterialApp(
      // home: App(),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const App(),
          bindings: [
            BindingsBuilder(() => {Get.lazyPut(() => NavigationController())}),
          ],
        ),
        GetPage(
          name: '/details/:id',
          binding:
              BindingsBuilder(() => {Get.lazyPut(() => DetailsController())}),
          page: () => Details(),
        )
      ],
    ),
  );
}
