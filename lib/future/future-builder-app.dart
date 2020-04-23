import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FutureBuilderApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }

}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyStatefulWidgetState();
  }

}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  Future<String> _calculation = Future<String>.delayed(
      Duration(seconds: 2),
          () => 'Data Loaded'
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder<String>(
      future: _calculation,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          children = <Widget>[
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 60,
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Result: ${snapshot.data}'),
            )
          ];
        } else if (snapshot.hasError) {
          children = <Widget>[
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            )
          ];
        } else {
          children = <Widget>[
            SizedBox(
              child: CircularProgressIndicator(),
              width: 60,
              height: 60,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Awaiting result....'),
            )
          ];
        }

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children,
          ),
        );
      },
    );
  }
}