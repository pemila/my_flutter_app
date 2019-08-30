import 'dart:async';
import 'dart:ui' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AssetsPageRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
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
/*    @override
    Widget build(BuildContext context) {
        loadAsset().then((txt)=> print(txt) );
        return Column(
            children: <Widget>[
                // 加载图片获得widget
                Image.asset("assets/icon1.png"),
            ],
        );
    }*/

/*  使用 new AssetImage加载图片*/
    @override
    Widget build(BuildContext context){
        loadAsset().then((txt)=> print(txt) );
        AssetImage assetImage = new AssetImage("assets/icon2.png");
        return Column(
            children: <Widget>[
                new Image(image: assetImage,width: 200,height: 500,),
            ],
        );
    }
}