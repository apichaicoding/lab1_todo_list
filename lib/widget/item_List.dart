import 'package:flutter/material.dart';
import 'package:lab1_todo_list/model/todo_list_model.dart';
import 'package:provider/provider.dart';
import 'package:lab1_todo_list/provider/todo_list_provider.dart';

class ItemList extends StatefulWidget {
  const ItemList({super.key, required this.item});
  final Todo item;

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  void initState() {
    _textEditingController.text = widget.item.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Item'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _textEditingController,
              onFieldSubmitted: (value) => submit(),
              textCapitalization: TextCapitalization.sentences,
              autofocus: true,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: submit,
              child: Text('Add Item'),
            )
          ],
        ),
      ),
    );
  }

  void submit() {
    String description = _textEditingController.text;
    if (description.isNotEmpty) {
      if (widget.item.description.isNotEmpty) {
        context.read<TodoListProvider>().editItemTask(widget.item, description);
      } else {
        context.read<TodoListProvider>().addItemTask(description);
      }
    }

    Navigator.pop(context, _textEditingController.text);
  }
}
