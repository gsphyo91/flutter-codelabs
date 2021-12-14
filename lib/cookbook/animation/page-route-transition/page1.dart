import 'package:flutter/material.dart';
import 'package:flutter_codelab/cookbook/animation/page-route-transition/page2.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: ElevatedButton(
        child: const Text('Go!'),
        onPressed: () {
          Navigator.of(context).push(_createRoute());
        },
      )),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          // final tween = Tween(begin: begin, end: end);
          // final offsetAnimation = animation.drive(tween);

          // final tween =
          //     Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          final tween = Tween(begin: begin, end: end);
          final curvedAnimation =
              CurvedAnimation(parent: animation, curve: curve);

          return SlideTransition(
              // position: animation.drive(tween), child: child);
              position: tween.animate(curvedAnimation),
              child: child);
        });
  }
}
