import 'dart:html';

// Code from previous lesson
/*************************
* There are millions of ways to get this done.
 * You can use this code, or delete it and use the API below.
**************************/
void main() {
  var todo = querySelector('input');
  var submit = querySelector('button');
  var todoList = querySelector('#todos');

  submit.onClick.listen((e) => handleSubmit(e, todoList, todo));
}

handleSubmit(MouseEvent e, Element todoList, InputElement todo) {
  var newTodoValue = todo.value;
  var newTodo = new LIElement();
  newTodo.text = newTodoValue;
  todoList.append(newTodo);
  todo.value = "";
}

/*************************
    New API
 **************************/
//void main() {
//  var todoList = new TodoList(querySelector('#todos'));
//}

class TodoList {
  addTodo() {}
  deleteTodo() {}
}

class Todo {
  createTodoListItem() {}
}
