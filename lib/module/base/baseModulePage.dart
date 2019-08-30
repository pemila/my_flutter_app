import 'package:flutter/material.dart';

// Flutter基础组件演示
class BaseModulePage extends StatefulWidget{
  @override
  State<BaseModulePage> createState() {
    return BaseModuleState();
  }
}

class BaseModuleState extends State<BaseModulePage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
		appBar: AppBar(title: Text("基础组件演示"),),
		body: ListView(
			children: <Widget>[
				FlatButton(
					child: Text("StatelessWidget Demo"),
					onPressed: () {
						Navigator.of(context).pushNamed("echo_statelesswidget_route",arguments: "echo StateLessWidget");
					},
				),
				FlatButton(
					child: Text("StatefulWidget Demo"),
					onPressed: () {
						Navigator.pushNamed(context,"counter_statefulwidget_route");
					},
				),
			],
		),
	);
  }
}
