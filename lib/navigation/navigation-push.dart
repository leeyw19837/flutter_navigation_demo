/**
 * 传递数据到新页面 示例程序
 * https://flutter.cn/docs/cookbook/navigation/passing-data
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

class NavPushApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: 'Passing Data',
        home: TodoScreen(
            todos: List.generate(20,(i)=>Todo(
              'Todo $i',
              'A description for todo item $i',
            ))
        )
    );
  }
}

class TodoScreen extends StatelessWidget {
  final List<Todo> todos;

  TodoScreen({Key key, @required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                  todos[index].title
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailScreen(),
                        settings: RouteSettings(
                          arguments: todos[index],
                        )
                    )
                );
              },
            );
          }
      ),
    );
  }

}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Todo todo = ModalRoute
        .of(context)
        .settings
        .arguments;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}