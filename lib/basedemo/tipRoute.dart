import 'package:flutter/material.dart';

// 路由传值示例
class TipRoute extends StatelessWidget {
  final String text;

  // 定义构造方法 接收一个参数text
  TipRoute({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: ()=>Navigator.pop(context,"this is result"),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}