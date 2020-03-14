import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Container(
          child: WebView(
        initialUrl: Uri.dataFromString(
                '<html><body><iframe src="http://llmchurch.org/about.php" width="100%" height="100%" frameBorder="0"></iframe></body></html>',
                mimeType: 'text/html')
            .toString(),
        javascriptMode: JavascriptMode.unrestricted,
      )),
    );
  }
}
