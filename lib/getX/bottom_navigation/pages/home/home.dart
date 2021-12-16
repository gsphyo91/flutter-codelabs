import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var scrollController = ScrollController().obs;

  RxList<dynamic> productList = [].obs;
  RxBool isLoading = false.obs;
  RxBool hasMore = false.obs;

  @override
  void onInit() {
    _getData();

    scrollController.value.addListener(() {
      if (scrollController.value.position.pixels ==
              scrollController.value.position.maxScrollExtent &&
          hasMore.value) {
        _getData();
      }
    });

    super.onInit();
  }

  _getData() async {
    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2));

    int offset = productList.length;
    List appendData = List<dynamic>.generate(
        10,
        (index) =>
            {"id": index + 1 + offset, "name": "리복 마르지엘라 타비 us7.5사이즈 팝니다"});
    // List appendData = List<dynamic>.generate(
    //     10, (index) => {"id": index + 1 + offset, "name": "name"});

    productList.addAll(appendData);

    isLoading.value = false;
    hasMore.value = productList.length < 100;
    // print(productList);
  }

  reload() async {
    isLoading.value = true;
    productList.clear();

    await Future.delayed(const Duration(seconds: 2));

    _getData();
  }
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 50.0,
        title: const Text('동네'),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        leadingWidth: 20.0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('search'),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('menu'),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('notification'),
              ),
            ),
          ),
        ],
        actionsIconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: ListView.separated(
            controller: _homeController.scrollController.value,
            itemBuilder: (context, index) {
              if (index < _homeController.productList.length) {
                String productName = _homeController.productList[index]['name'];
                return ListTile(
                  title: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 5.0),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Image.asset(
                            'assets/images/product.jpeg',
                            height: 100.0,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productName,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                                softWrap: true,
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text(
                                      '강서구 마곡동',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.0),
                                    ),
                                    Text(
                                      '3일 전',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Text(
                                '240,000원',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Icon(
                                    Icons.favorite_border_outlined,
                                    size: 14.0,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    '3',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              if (_homeController.hasMore.value ||
                  _homeController.isLoading.value) {
                return const Center(
                  child: RefreshProgressIndicator(
                    color: Colors.red,
                  ),
                );
              }
              return const Text('마지막 데이터');
            },
            separatorBuilder: (context, index) => const Divider(
              color: Colors.grey,
            ),
            itemCount: _homeController.productList.length + 1,
          ),
        ),
      ),
    );
  }
}
