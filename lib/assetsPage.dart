import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AssetsPageRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text("资源展示"),),
        body: Center(
            child: AssetsPageWidget(),
        ),
    );
  }

}

class AssetsPageWidget extends StatelessWidget{
    // 加载文本内容
    Future<String>  loadAsset() async {
        return await rootBundle.loadString("assets/text.txt");
    }
    @override
    Widget build(BuildContext context) {
        loadAsset().then((txt)=> print(txt) );
        return Column(
            children: <Widget>[
                // 加载图片获得widget
                Image.asset("assets/icon1.png"),
            ],
        );
    }
}
