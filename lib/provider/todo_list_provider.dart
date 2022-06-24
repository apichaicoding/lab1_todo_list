import 'package:flutter/foundation.dart';
import 'package:lab1_todo_list/model/todo_list_model.dart';

class TodoListProvider with ChangeNotifier {
  List<Todo> items = List<Todo>.empty(growable: true);

  void editItemTask(Todo item, String description) {
    if (description != '') {
      item.description = description;
      notifyListeners();
    }
  }

  void addItemTask(String description) {
    if (description != '') {
      items.add(Todo(description: description));
      notifyListeners();
    }
  }

  void gotoRemoveItem(Todo item) {
    items.remove(item);
    notifyListeners();
  }

  void changeCompleteness(Todo item) {
    item.completed = !item.completed;
    notifyListeners();
  }
}
