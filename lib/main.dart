import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lab1_todo_list/model/todo_list_model.dart';
import 'package:lab1_todo_list/provider/todo_list_provider.dart';
import 'package:lab1_todo_list/widget/item_List.dart';
import 'package:lab1_todo_list/widget/todo_item.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TodoListProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static String title = 'Lab1 To Do List';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Consumer<TodoListProvider>(
        builder: (context, provider, child) => provider.items.isNotEmpty
            ? ListView.builder(
                itemCount: provider.items.length,
                itemBuilder: (context, index) => TodoItem(
                  item: provider.items[index],
                  onTap: provider.changeCompleteness,
                  onLongPress: gotoEditItem,
                  onDismissed: provider.gotoRemoveItem,
                ),
              )
            : Center(
                child: Text("No Items"),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: gotoAddItem,
        child: Icon(Icons.add),
      ),
    );
  }

  void gotoAddItem() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        // return Container();
        return ItemList(
          item: Todo(description: ''),
        );
      },
    ));
  }

  void gotoEditItem(Todo item) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return ItemList(item: item);
      },
    ));
  }
}
