import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> todoList = [];
  TodoBloc() : super(const TodoState()) {
    on<ADDTodoEvent>(_addTODOelement);
    on<RemoveTODOelementAT>(_removeToDOelemnt);
  }

  _addTODOelement(ADDTodoEvent event, Emitter<TodoState> emit) {
    todoList.add(event.todoEventTask);
    emit(state.copywith(todoList: List.from(todoList)));
  }

  _removeToDOelemnt(RemoveTODOelementAT event, Emitter<TodoState> emit) {
    todoList.removeAt(event.index);
    emit(state.copywith(todoList: List.from(todoList)));
  }
}
