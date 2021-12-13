// Adding WebView to your Flutter app
// https://codelabs.developers.google.com/codelabs/flutter-webview?hl=en#0

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_codelab/codelabs/webview/src/menu.dart';
import 'package:flutter_codelab/codelabs/webview/src/navigation_controls.dart';
import 'package:flutter_codelab/codelabs/webview/src/web_view_stack.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewApp extends StatefulWidget {
  const WebViewApp({Key? key}) : super(key: key);

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  final controller = Completer<WebViewController>();

  // 그냥 실행했을 때, Javascript가 실행되지 않기 때문에, 아래 initState에서 javascript를 실행하는 기능을 넣어줘야 함
  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView'),
        actions: [
          NavigationControls(controller: controller),
          Menu(controller: controller)
        ],
      ),
      // body: const WebView(initialUrl: 'https://flutter.dev'));
      body: WebViewStack(controller: controller),
    );
  }
}
