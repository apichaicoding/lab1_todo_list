import 'package:flutter/material.dart';
import 'package:lab1_todo_list/model/todo_list_model.dart';

class TodoItem extends StatelessWidget {
  const TodoItem(
      {super.key,
      required this.item,
      required this.onTap,
      required this.onLongPress,
      required this.onDismissed});
  final Todo item;
  final Function(Todo) onTap;
  final Function(Todo) onLongPress;
  final Function(Todo) onDismissed;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item.hashCode.toString()),
      direction: DismissDirection.startToEnd,
      background: Container(
        padding: EdgeInsets.only(left: 12),
        color: Colors.red,
        alignment: Alignment.centerLeft,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      onDismissed: (direction) => onDismissed(item),
      child: ListTile(
        title: Text(
          item.description,
          style: TextStyle(
              decoration: item.completed ? TextDecoration.lineThrough : null),
        ),
        trailing: Icon(
            item.completed ? Icons.check_box : Icons.check_box_outline_blank),
        onTap: () => onTap(item),
        onLongPress: () => onLongPress(item),
      ),
    );
  }
}
