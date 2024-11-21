part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class ADDTodoEvent extends TodoEvent {
  final String todoEventTask;
  const ADDTodoEvent({required this.todoEventTask});

  @override
  List<Object> get props => [todoEventTask];
}

class RemoveTODOelementAT extends TodoEvent {
  final int index;

  const RemoveTODOelementAT({required this.index});

  @override
  List<Object> get props => [index];
}
