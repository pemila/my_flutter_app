import 'package:flutter/material.dart';

/*
    Widget 状态管理
        1. Widget管理自己的状态。
            如果状态是有关界面外观效果的，例如颜色、动画，那么状态最好由Widget本身来管理。
        2. Widget管理子Widget状态。
            如果状态是用户数据，如复选框的选中状态、滑块的位置，则该状态最好由父Widget管理
            如果某一个状态是不同Widget共享的则最好由它们共同的父Widget管理。
        3. 混合管理（父Widget和子Widget都管理状态）。
*/

//============================================================================
// TapBoxA管理自身状态
class TapBoxA extends StatefulWidget {
    TapBoxA({Key key}) :super(key: key);
    @override
    State<StatefulWidget> createState() => _TapBoxAState();
}

class _TapBoxAState extends State<TapBoxA>{
    // 定义确定盒子颜色的布尔值
    bool _active = false;
    // 定义函数 用于在点击盒子时更新_active，并调用setState()刷新UI
    void _handleTap(){
        setState(() {
          _active = !_active;
        });
    }

    @override
    Widget build(BuildContext context) {
        return new GestureDetector(
            onTap: _handleTap,
            child: new Container(
                child: new Center(
                    child: new Text(
                        _active ? "Active" : "Inactive",
                        style: new TextStyle(fontSize: 32.0,color: Colors.white),
                    ),
                ),
                width: 200.0,
                height: 200.0,
                decoration: new BoxDecoration(
                    color: _active? Colors.lightGreen[700] : Colors.grey[600]
                ),
            ),
        );
    }
}

//============================================================================
// 父Widget管理子Widget的状态

// ParentB管理TapBoxB的状态，因此使用StatefulWidget
class ParentB extends StatefulWidget {
    @override
    State<StatefulWidget> createState() => _ParentBState();
}

class _ParentBState extends State<ParentB> {
    // 为TapBoxB管理_active状态
    bool _active = false;
    // 当盒子被点击时调用，并在状态改变时更新UI
    void _handleTopBoxChanged(bool newValue){
        setState(() {
          _active = newValue;
        });
    }
    @override
    Widget build(BuildContext context) {
        return new TapBoxB(
            active: _active,
            onChanged: _handleTopBoxChanged,
        );
    }
}
// TapBoxB没有自身需要管理的状态，因此使用StatelessWidget
class TapBoxB extends StatelessWidget {
    TapBoxB({Key key,this.active:false,@required this.onChanged}):super(key:key);
    final bool active;
    final ValueChanged<bool> onChanged;
    // 通知ParentB
    void _handleTap(){
        onChanged(!active);
    }
    @override
    Widget build(BuildContext context) {
        return new GestureDetector(
            // 检测到点击时通知ParentB
            onTap: _handleTap,
            child: new Container(
                child: new Center(
                    child: new Text(
                        active ? 'Active' : 'Inactive',
                        style: new TextStyle(fontSize: 32.0, color: Colors.white),
                    ),
                ),
                width: 200.0,
                height: 200.0,
                decoration: new BoxDecoration(
                    color: active ? Colors.lightGreen[200] : Colors.grey[900],
                ),
            ),
        );
    }
}

//============================================================================
// 混合状态管理
// ParentC管理 TapBoxC的外部状态，TapBoxC管理自身的内部状态
