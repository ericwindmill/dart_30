import 'dart:html';
import 'dart:math';

void main() {
  var todoList = new TodoList(querySelector('#todos'));
}

class TodoList {
  final UListElement list;
  ButtonElement submitButton;
  InputElement newTodoInput;
  int listLength = 0;

  TodoList(this.list) {
    submitButton = querySelector('#submit');
    newTodoInput = querySelector('input');
    submitButton.onClick.listen((e) => addTodo());
  }

  void addTodo() {
    var newTodoValue = newTodoInput.value;
    var newTodo = new Todo(newTodoValue, deleteTodo, listLength);
    var li = newTodo.createTodo();
    list.append(li);
    newTodoValue = "";
    listLength += 1;
  }

  void deleteTodo(Event e, Todo todo) {
    todo.li.remove();
  }
}

class Todo {
  final String innerText;
  final Function deleteTodo;
  final int ID;
  Element listItem;

  Todo(this.innerText, this.deleteTodo, this.ID);

  Element get li => listItem;
  void set li(Element listItem) => li = listItem;

  createTodo() {
    listItem = new LIElement()
      ..id = ID.toString()
      ..append(new ParagraphElement()..text = innerText)
      ..append(new ButtonElement()
        ..classes.add(ID.toString())
        ..text = 'x'
        ..style.background = 'palevioletred'
        ..onClick.listen((Event e) {
          deleteTodo(e, this);
        }));

    return li;
  }
}
