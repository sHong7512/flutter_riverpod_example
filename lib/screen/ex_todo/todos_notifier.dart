import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/screen/ex_todo/todo.dart';

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier(): super([]);

  // 할 일 추가
  void addTodo(Todo todo) {
    /*
    state 는 immutable 데이터이기 때문에 직접적으로 state 를 변경할 수 없다.
    state = [...state, ex_todo];
    이와 같이 새로운 state를 생성해주도록 하자
   */
    state = [...state, todo];
  }

  // 할 일 삭제
  void removeTodo(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id != todoId) todo,
    ];
  }

  // 할 일 완료 표시 변경
  void toggle(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id == todoId)
          todo.copyWith(completed: !todo.completed)
        else
          todo,
    ];
  }
}

final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
  return TodosNotifier();
});