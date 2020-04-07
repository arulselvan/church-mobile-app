import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
//import 'package:webview_media/webview_flutter.dart';

/*
class Contact extends StatelessWidget {
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
      ),
      body: Container(
          child: WebView(
        onWebViewCreated: (webViewController) {
          print('on webview created');
          _controller = webViewController;
        },
        initialUrl: 'http://llmchurch.org/contact.php',
        javascriptMode: JavascriptMode.unrestricted,
        onPageFinished: (finish) {
          String scriptToExecute =
              "document.getElementsByClassName('site-header')[0].style.display = 'none';document.getElementsByClassName('site-footer-bottom')[0].style.display = 'none'";
          _controller.evaluateJavascript(scriptToExecute);
          isLoading = false;
        },
      )),
    );
  }
}
*/

class Contact extends StatefulWidget {
  @override
  _contactState createState() =>
      _contactState('Contact', 'http://llmchurch.org/contact.php');
}

class _contactState extends State<Contact> {
  String title, url;
  bool isLoading = true;
  final _key = UniqueKey();
  WebViewController _controller;

  _contactState(String title, String url) {
    this.title = title;
    this.url = url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: Text(this.title)),
      body: IndexedStack(
        index: isLoading ? 1 : 0,
        children: <Widget>[
          WebView(
            key: _key,
            initialUrl: this.url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (webViewController) {
              print('inside onWebViewCreated');
              _controller = webViewController;
            },
            onPageFinished: (finish) {
              print('inside onPageFinished');
              String scriptToExecute =
                  "document.getElementsByClassName('site-header')[0].style.display = 'none';document.getElementsByClassName('site-footer-bottom')[0].style.display = 'none'";
              _controller.evaluateJavascript(scriptToExecute);
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(color: Colors.transparent),
        ],
      ),
    );
  }
}
