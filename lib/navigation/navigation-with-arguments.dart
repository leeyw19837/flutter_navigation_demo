/**
 * 给特定的 route 传参
 * 实例程序
 * https://flutter.cn/docs/cookbook/navigation/navigate-with-arguments
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Navigate to screen that extracts arguments.'),
              onPressed: () {
                Navigator.pushNamed(
                    context,
                    ExtractArgumentsScreen.routeName,
                    arguments: ScreenArguments('Extract Arguments Screen', 'This msg is extractd in the build method.')
                );
              },
            ),
            RaisedButton(
              child: Text('Navigate to named that accepts arguments.'),
              onPressed: () {
                Navigator.pushNamed(
                    context,
                    PassArgumentsScreen.routeName,
                    arguments: ScreenArguments('Accept Arguments Screen', 'This meg is extracted in the onGenerateRoute function.')
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class ExtractArgumentsScreen extends StatelessWidget {
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    final ScreenArguments arguments = ModalRoute
        .of(context)
        .settings
        .arguments;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.title),
      ),
      body: Center(
        child: Text(arguments.message),
      ),
    );
  }
}

class PassArgumentsScreen extends StatelessWidget {
  static const routeName = '/passArguments';

  final String title;
  final String message;

  PassArgumentsScreen({Key key, @required this.title, @required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}

class WithArgsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      routes: {
        ExtractArgumentsScreen.routeName: (context) => ExtractArgumentsScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == PassArgumentsScreen.routeName) {
          final ScreenArguments arguments = settings.arguments;
          return MaterialPageRoute(builder: (context) {
            return PassArgumentsScreen(
              title: arguments.title,
              message: arguments.message,
            );
          });
        }
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
      title: 'Navigation with arguments',
      home: HomeScreen(),
    );
  }
}
