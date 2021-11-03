import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

//플러터(Flutter) - VSCode에서 gradle sync 하기
//https://blog.naver.com/chandong83/222063184403
//.\gradlew --refresh-dependencies

//BUG! exception in phase 'semantic analysis' in source unit '_BuildScript_' Unsupported class file major version 60
// https://velog.io/@juunini/react-native-%EC%95%88%EB%93%9C%EB%A1%9C%EC%9D%B4%EB%93%9C-%EB%B9%8C%EB%93%9C%EA%B0%80-%EC%95%88%EB%90%A0-%EB%95%8C-Unsupported-class-file-major-version-60
// 아이콘 제작 사이트
// https://appicon.co/

//build test
//flutter build apk --release --target-platform=android-arm64 --no-sound-null-safety
//flutter build appbundle --release --target-platform=android-arm64 --no-sound-null-safety
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SWM Algoridang',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WebViewPage(),
    );
  }
}

class WebViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            body: Container(
          margin: EdgeInsets.only(top: statusBarHeight),
          child: WebView(
            initialUrl: "https://www.algoridang.com/takers/ticker-search",
            javascriptMode: JavascriptMode.unrestricted,
          ),
        )));
  }
}
