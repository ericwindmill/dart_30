import 'dart:html';

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