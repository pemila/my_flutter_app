import 'package:flutter/material.dart';
import 'package:my_flutter_app/tipRoute.dart';
import 'newRoute.dart';

// 首页
class MyHomePage extends StatefulWidget {
    MyHomePage({Key key, this.title}) : super(key: key);
    final String title;
    @override
    _MyHomePageState createState() => _MyHomePageState();
}

// homePage的state对象
class _MyHomePageState extends State<MyHomePage> {
    // 组件状态，此处为计数器
    int _counter = 0;
    //  设置状态的自增函数
    void _incrementCounter() {
        setState(() {
            _counter++;
        });
    }
    // 构建UI界面
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(widget.title),
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Text(
                            'You have click the button this many times:',
                        ),
                        Text(
                            '$_counter',
                            style: Theme.of(context).textTheme.display1,
                        ),
                        // 新增按钮，点击之后跳转新页面
                        FlatButton(
                            child: Text("open new route"),
                            textColor: Colors.blue,
                            onPressed: () {
                                // 添加路由事件
                                Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context) {
                                            return NewRoute();
                                        }
                                    )
                                );
                            },
                        ),
                        FlatButton(
                            // 使用路由名称跳转
                            child: Text("open new route by routeName"),
                            textColor: Colors.blue,
                            onPressed: () {
                                // 添加路由事件
                                Navigator.pushNamed(context,"new_route");
                            },
                        ),
                        FlatButton(
                            // 使用路由名称跳转
                            child: Text("open new route cross by onGenerateRoute"),
                            textColor: Colors.blue,
                            onPressed: () {
                                // 添加路由事件
                                Navigator.pushNamed(context,"gen_route");
                            },
                        ),
                        FlatButton(
                            child: Text("Word Page"),
                            textColor: Colors.blue,
                            onPressed: () {
                                Navigator.pushNamed(context,"word_route");
                            },
                        ),
                        FlatButton(
                            child: Text("Assets Page"),
                            textColor: Colors.blue,
                            onPressed: () {
                                Navigator.pushNamed(context,"assets_route");
                            },
                        ),
                        // 创建一个可接收返回值的路由
                        RaisedButton(
                            textColor: Colors.green,
                            onPressed: () async {
                                // 打开`TipRoute`，并等待返回结果
                                var result = await Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context){
                                            return TipRoute(text: "我是提示",);
                                        }
                                    )
                                );
                                // 输出`TipRoute`路由返回的结果
                                print("路由返回值: $result");
                            },
                            child: Text("打开提示页"),
                        ),
                        RaisedButton(
                            textColor: Colors.green,
                            onPressed: () async {
                                // 打开`TipRoute`，并等待返回结果
                                var result = await Navigator.of(context).pushNamed("tip_route", arguments: "hi");
                                // 输出`TipRoute`路由返回的结果
                                print("路由返回值: $result");
                            },
                            child: Text("打开提示页(通过命名调用)"),
                        ),
                    ],
                ),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: Icon(Icons.add),
            ), // This trailing comma makes auto-formatting nicer for build methods.
        );
    }
}