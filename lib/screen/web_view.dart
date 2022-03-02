import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen( {Key? key,required this.url }) : super(key: key);
  final String url ;
  @override
  Widget build(BuildContext context) {
    late WebViewController controller ;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller){

          },


        ),
      )
    );
  }
}
