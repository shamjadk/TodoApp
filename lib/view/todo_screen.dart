import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/model/todo_model.dart';
import 'package:state_management/provider/todo_provider.dart'; 

class TodoScreen2 extends ConsumerWidget {
  TodoScreen2({super.key});
  final TextEditingController todoController2 = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: ListView.builder(
        itemCount: ref.watch(todoProvider2).length,
        itemBuilder: (context, index) => ListTile(
          leading: Checkbox(
            value: ref.watch(todoProvider2)[index].isChecked,
            onChanged: (value) {
              ref.read(todoProvider2.notifier).updateTodo2(
                  index,
                  TodoModel2(
                      text: ref.watch(todoProvider2)[index].text,
                      isChecked: value!));
            },
          ),
          title: Text(
            ref.watch(todoProvider2)[index].text,
            style: const TextStyle(color: Colors.black),
          ),
          trailing: IconButton(
              onPressed: () {
                ref.read(todoProvider2.notifier).todoRemove2(index);
              },
              icon: const Icon(Icons.close)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Todo'),
                content: TextField(
                  controller: todoController2,
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.blue,
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        ref.read(todoProvider2.notifier).todoAdd2(TodoModel2(
                            text: todoController2.text, isChecked: false));
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.add))
                ],
              );
            },
          );
          todoController2.clear();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
