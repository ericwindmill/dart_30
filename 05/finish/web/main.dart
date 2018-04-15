import 'dart:html';

void main() {
  var todoList = new TodoList(querySelector('#todos'));
}

class TodoList {
  final UListElement list;
  ButtonElement submitButton;
  InputElement newTodoInput;

  TodoList(this.list) {
    submitButton = querySelector('#submit');
    newTodoInput = querySelector('input');
    submitButton.onClick.listen((e) => addTodo());
  }

  void addTodo() {
    var newTodoValue = newTodoInput.value;
    var newTodo = new Todo(newTodoValue, deleteTodo);
    var li = newTodo.createTodo();
    list.append(li);
    newTodoInput.value = "";
  }

  void deleteTodo(Event e, Todo todo) {
    todo.li.remove();
  }
}

class Todo {
  final String innerText;
  final Function deleteTodo;
  Element listItem;

  Todo(this.innerText, this.deleteTodo);

  Element get li => listItem;
  void set li(Element listItem) => li = listItem;

  createTodo() {
    listItem = new LIElement()
      ..append(new ParagraphElement()..text = innerText)
      ..append(new ButtonElement()
        ..text = 'x'
        ..style.background = 'palevioletred'
        ..onClick.listen((Event e) {
          deleteTodo(e, this);
        }));

    return li;
  }
}
