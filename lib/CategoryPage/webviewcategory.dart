import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webviewCategory extends StatelessWidget {
  var details;
  var source;
  webviewCategory({this.details, this.source});
  @override
  Widget build(BuildContext context) {
    final Completer<WebViewController> _completer =
        Completer<WebViewController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Source: $source",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
          child: Container(
        child: WebView(
          initialUrl: details,
          onWebViewCreated: ((WebViewController webViewcontroller) {
            _completer.complete(webViewcontroller);
          }),
        ),
      )),
    );
  }
}
