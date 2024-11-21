import 'package:bloc_operations/controller/todo_bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyTODOApp extends StatelessWidget {
  const MyTODOApp({super.key});

  @override
  Widget build(BuildContext context) {
    int tODOlendth = 0;
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(child: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            tODOlendth = state.todoList.length;
            if (state.todoList.isEmpty) {
              return const Center(
                child: Text("NO TODO Founded"),
              );
            } else {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(state.todoList[index].toString()),
                      trailing: IconButton(
                          onPressed: () {
                            context
                                .read<TodoBloc>()
                                .add(RemoveTODOelementAT(index: index));
                          },
                          icon: const Icon(Icons.delete)),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: state.todoList.length);
            }
          },
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            for (var i = 0; i < 5; i++) {
              context
                  .read<TodoBloc>()
                  .add(ADDTodoEvent(todoEventTask: "TODO ${tODOlendth + i}"));
            }
          },
          child: const Icon(Icons.add),
        ));
  }
}
