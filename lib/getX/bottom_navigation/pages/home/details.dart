import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  RxInt id = 0.obs;
  RxInt carouselIndex = 0.obs;
  RxBool fullScreenCarousel = false.obs;

  @override
  void onInit() {
    id.value = int.parse(Get.parameters['id']!);
    super.onInit();
  }

  onChangeCarousel({required int index}) {
    carouselIndex.value = index;
  }

  toggleFullScreenCarousel() {
    fullScreenCarousel.value = !fullScreenCarousel.value;
  }
}

class Details extends GetView<DetailsController> {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 30.0,
        leading: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.chevron_left),
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(0.0),
              onPressed: () => Get.back(),
            ),
            IconButton(
              icon: const Icon(Icons.home_outlined),
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(0.0),
              onPressed: () => Get.offAllNamed('/'),
            ),
          ],
        ),
        leadingWidth: 100.0,
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined),
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(0.0),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert_outlined),
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(0.0),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Get.to(const FullCarousel(),
                transition: Transition.noTransition),
            child: Hero(
              tag: 'carousel',
              child: Container(
                margin: const EdgeInsets.all(0.0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Stack(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height * 0.4,
                        autoPlay: false,
                        enableInfiniteScroll: false,
                        initialPage: 0,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) =>
                            controller.onChangeCarousel(index: index),
                      ),
                      items: [1, 2, 3, 4, 5].map(
                        (i) {
                          return Image.asset(
                            'assets/images/product.jpeg',
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                          );
                        },
                      ).toList(),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [1, 2, 3, 4, 5].map((i) {
                            return Obx(
                              () => Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child: Icon(
                                  Icons.circle,
                                  size: 10.0,
                                  color: controller.carouselIndex.value + 1 == i
                                      ? Colors.white
                                      : Colors.grey,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FullCarousel extends GetView<DetailsController> {
  const FullCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.close_outlined),
          )
        ],
      ),
      body: GestureDetector(
        onTap: () => Get.back(),
        child: Hero(
          tag: 'carousel',
          child: Container(
            margin: const EdgeInsets.all(0.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1.0,
            child: Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 1.0,
                    autoPlay: false,
                    enableInfiniteScroll: false,
                    initialPage: 0,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) =>
                        controller.onChangeCarousel(index: index),
                  ),
                  items: [1, 2, 3, 4, 5].map(
                    (i) {
                      return Image.asset(
                        'assets/images/product.jpeg',
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      );
                    },
                  ).toList(),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [1, 2, 3, 4, 5].map((i) {
                        return Obx(
                          () => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 2.0),
                            child: Icon(
                              Icons.circle,
                              size: 10.0,
                              color: controller.carouselIndex.value + 1 == i
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
