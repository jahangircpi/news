import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class detailspage extends StatelessWidget {
  var detailsurl;
  var source;
  detailspage({this.detailsurl, this.source});
  @override
  Widget build(BuildContext context) {
    final Completer<WebViewController> _completer =
        Completer<WebViewController>();
    var size = MediaQuery.of(context).size;
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
      body: Container(
        height: size.height,
        width: size.width,
        child: WebView(
          initialUrl:
              detailsurl == null ? "Oops! please read other news" : detailsurl,
          onWebViewCreated: ((WebViewController webViewcontroller) {
            _completer.complete(webViewcontroller);
          }),
        ),
      ),
    );
  }
}
