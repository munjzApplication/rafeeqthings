part of 'todo_bloc.dart';

class TodoState extends Equatable {
  final List<String> todoList;
  const TodoState({this.todoList = const []});

  TodoState copywith({required List<String>? todoList}) {
    return TodoState(todoList: todoList ?? this.todoList);
  }

  @override
  List<Object> get props => [todoList];
}
