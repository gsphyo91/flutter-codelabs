import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class Routes {
//   static const routes = [
//     HOME
//   ]
// }

class NavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;

  changeIndex(index) {
    selectedIndex.value = index;
  }
}

class BottomSheets extends StatelessWidget {
  BottomSheets({Key? key}) : super(key: key);

  final NavigationController _navigationController =
      Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(
          fontSize: 12.0,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12.0,
        ),
        onTap: _navigationController.changeIndex,
        currentIndex: _navigationController.selectedIndex.value,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '홈',
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: '동네생활',
            activeIcon: Icon(Icons.article),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place_outlined),
            label: '내 근처',
            activeIcon: Icon(Icons.place),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: '채팅',
            activeIcon: Icon(Icons.chat),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '나의 당근',
            activeIcon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
