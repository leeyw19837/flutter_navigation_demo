/**
 * 导航到一个新页面和返回
 * 示例程序
 * https://flutter.cn/docs/cookbook/navigation/navigation-basics
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Navigation Basis',
      home: FirstRoute(),
    );
  }

}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Open route'),
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>SecondRoute())
            );
          },
        ),
      ),
    );
  }

}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Route'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }

}