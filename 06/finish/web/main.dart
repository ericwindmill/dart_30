import 'dart:html';

void main() {
  var dropdown = querySelector('#dropdown');
  dropdown.addEventListener('change', handleSelect);
}

void handleSelect(e) {
  var methods = new ListMethods();
  var method = e.target.value;
  var descriptionElement = querySelector('.method-description');
  switch (method) {
    case 'add':
      methods.handleAdd();
      descriptionElement.text = 'list.add(element)';
      break;
    case 'map':
      methods.handleMap();
      descriptionElement.text = 'list.map(callback(element) => new Iterable)';
      break;
    case 'forEach':
      methods.handleForEach();
      descriptionElement.text =
          'list.forEach(callback(element) { \n produce side effects for each \n})';
      break;
    case 'toSet':
      methods.handleToSet();
      descriptionElement.text = 'list.toSet()';
      break;
    case 'where':
      methods.handleWhere();
      descriptionElement.text = 'list.where(callback(element) => new Iterable)';
      break;
    default:
      print('what happened?');
  }
}

class ListMethods {
  var listContainer = querySelector('.display-list');

  _listHelper() {
    var listContainer = querySelector('.display-list');
    var list = listContainer.text.split(',');
    return list.map((num) => int.parse(num)).toList();
  }

  void handleAdd() {
    var list = _listHelper();
    list.add(6);
    list = list.join(',');
    listContainer.text = list;
  }

  handleMap() {
    var list = _listHelper();
    list = list.map((num) => num * 2).toList();
    list.join(',');
    listContainer.text = list;
  }

  handleForEach() {
    var list = _listHelper();
    var newList = [];
    list.forEach((num) => newList.add(num + 2));
    list.join(',');
    listContainer.text = list;
  }

  handleToSet() {
    var list = _listHelper();
    list = list.toSet().toList();
    listContainer.text = list;
  }

  handleWhere() {
    var list = _listHelper();
    list = list.where((element) => element % 2 == 0).toList();
    listContainer.text = list;
  }
}
