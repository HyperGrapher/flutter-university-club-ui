import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/* 
class Webpage extends StatefulWidget {
  @override
  _WebpageState createState() => _WebpageState();
}

class _WebpageState extends State<Webpage> {

  static final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: "https:/google.com",
      
    );
  }
}

 */
class Webpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: "https:/google.com",
    );
  }
}