import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/model/todo_model.dart';

class TodoNotifier2 extends StateNotifier<List<TodoModel2>> {
  TodoNotifier2() : super([]);

  void todoAdd2(TodoModel2 tasks) {
    state = [...state, tasks];
  }

  void todoRemove2(int index) {
    state = [
      for (TodoModel2 nums in state)
        if (nums != state[index]) nums
    ];
  }

  void updateTodo2(int index, TodoModel2 update){
     state = [
      for (TodoModel2 nums in state)
        if (nums != state[index]) nums
        else update
    ];
  }
}

final todoProvider2 = StateNotifierProvider<TodoNotifier2, List<TodoModel2>>((ref) {
  return TodoNotifier2();
});
