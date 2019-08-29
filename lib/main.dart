import 'package:flutter/material.dart';
import 'package:my_flutter_app/NewRoute.dart';
import 'package:my_flutter_app/randomWord.dart';
import 'package:my_flutter_app/tipRoute.dart';
import 'homePage.dart';

void main() => runApp(MyApp());

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
        "/":(context)=> MyHomePage(title: "Demo Home Page",),
        "new_route":(context)=> NewRoute(),
        "word_route":(context)=>RandomWord(),
        // 带参数的路由使用命名调用
        "tip_route":(context)=> TipRoute(text: ModalRoute.of(context).settings.arguments,)
      },
      onGenerateRoute: (RouteSettings settings){
        // 对于需要进行权限控制的页面
        // 放弃使用路由表，使用onGenerateRoute回调，可以在此处进行统一的权限控制
        // 其他需要对路由进行判断的逻辑也可以使用此种方式
        return MaterialPageRoute(builder: (context){
          String routeName = settings.name;
          switch(routeName){
            case "gen_route":
                  return NewRoute();
          }
        });
      },
    );
  }
}