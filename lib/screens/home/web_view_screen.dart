import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart' show JavascriptMode, WebView;

class WebViewScreen extends StatefulWidget {
  final String url;

  WebViewScreen({required this.url});

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('                 MindEase',
          style: TextStyle(
            fontFamily: 'FontMainHeavy',
          ),),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
