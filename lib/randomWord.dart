import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 随机单词
class RandomWordWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final word = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(word.toString()),
    );
  }
}

class RandomWord extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Word Page"),
      ),
      body: Center(
        child: RandomWordWidget(),
      ),
    );
  }

}
