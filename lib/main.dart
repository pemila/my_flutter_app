import 'dart:async';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:my_flutter_app/basedemo/newRoute.dart';
import 'package:my_flutter_app/basedemo/assetsPage.dart';
import 'package:my_flutter_app/basedemo/randomWord.dart';
import 'package:my_flutter_app/basedemo/tipRoute.dart';
import 'package:my_flutter_app/basedemo/homePage.dart';
import 'package:my_flutter_app/logUtils.dart';
import 'package:my_flutter_app/module/base/baseModulePage.dart';
import 'package:my_flutter_app/module/base/widgetDemo.dart';

//void main() => runApp(MyApp());

void main() {
  // 处理Flutter捕获的异常
  FlutterError.onError = (FlutterErrorDetails details) {
    reportErrorAndLog(details);
  };

  // 同步执行的代码异常可以使用try..catch进行捕获，但是无法捕获异步执行的代码异常
  // 因此使用Flutter的runZone()方法，可以给执行对象指定一个Zone。
  // Zone为代码执行的环境范围(执行沙箱)，可以捕获、拦截、修改一些代码行为
  // 例如 捕获日志输出、Timer创建、微任务调度的行为，同时Zone也可以捕获所有未处理的异常
  runZoned(
    () => runApp(MyApp()),
    zoneSpecification: ZoneSpecification(
      // 拦截所有print方法输出日志的行为
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        collectLog(line); // 收集日志
      },
    ),
    // 使用onError回调拦截所有未被捕获的异常
    onError: (Object obj, StackTrace stack) {
      var details = makeDetails(obj, stack);
      reportErrorAndLog(details);
    },
    
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
/*
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 应用名称
      title: 'Flutter Demo',
      theme: ThemeData(
        // 主题颜色为blue
        primarySwatch: Colors.blue,
      ),
      // 应用首页路由
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
  */

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 应用名称
      title: 'Flutter Demo',
      // 初始化的路由页面
      initialRoute: "/",
      theme: ThemeData(
        // 主题颜色为blue
        primarySwatch: Colors.blue,
      ),
      // 注册路由
      routes: {
        "/": (context) => MyHomePage(
              title: "Demo Home Page",
            ),
        "new_route": (context) => NewRoute(),
        "word_route": (context) => RandomWord(),
        // 带参数的路由使用命名调用
        "tip_route": (context) => TipRoute(
              text: ModalRoute.of(context).settings.arguments,
            ),
        "assets_route": (context) => AssetsPageRoute(),
        "base_module_route":(context)=> BaseModulePage(),
        "echo_statelesswidget_route": (context) => Echo(
              text: ModalRoute.of(context).settings.arguments,
            ),
        "counter_statefulwidget_route":(context)=> Counter(),
      },
      onGenerateRoute: (RouteSettings settings) {
        // 对于需要进行权限控制的页面
        // 放弃使用路由表，使用onGenerateRoute回调，可以在此处进行统一的权限控制
        // 其他需要对路由进行判断的逻辑也可以使用此种方式
        return MaterialPageRoute(builder: (context) {
          String routeName = settings.name;
          switch (routeName) {
            case "gen_route":
              return NewRoute();
          }
        });
      },
    );
  }
}

void collectLog(String line) {
  //收集日志
  LogUtils.i("print", line);
}

void reportErrorAndLog(FlutterErrorDetails details) {
  //上报错误和日志逻辑
}

FlutterErrorDetails makeDetails(Object obj, StackTrace stack) {
  // 构建错误信息
}
