import 'package:flutter/material.dart';
import 'package:flutter_codelab/getX/bottom_navigation/bottom_sheets.dart';
import 'package:flutter_codelab/getX/bottom_navigation/pages/chat.dart';
import 'package:flutter_codelab/getX/bottom_navigation/pages/home/home.dart';
import 'package:flutter_codelab/getX/bottom_navigation/pages/mypage.dart';
import 'package:flutter_codelab/getX/bottom_navigation/pages/neighbor.dart';
import 'package:flutter_codelab/getX/bottom_navigation/pages/place.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final NavigationController _navigationController =
      Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: _navigationController.selectedIndex.value,
          children: [
            Home(),
            const Neighbor(),
            const Place(),
            const Chat(),
            const MyPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomSheets(),
    );
  }
}
