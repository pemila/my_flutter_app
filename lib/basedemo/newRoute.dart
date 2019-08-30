import 'package:flutter/material.dart';

// 演示路由页面跳转
class NewRoute extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        // TODO: implement build
        return Scaffold(
            appBar: AppBar(
                title: Text("new route"),
            ),
            body: Center(
                child: new Text("this is new route"),
            ),
        );
    }
}