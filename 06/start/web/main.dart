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
    // Change the list with list.add()
  }

  handleMap() {
    var list = _listHelper();
  // Change the list with list.map()
  }

  handleForEach() {
    var list = _listHelper();
  // Change the list with list.forEach()
  }

  handleToSet() {
    var list = _listHelper();
  // Change the list with list.toSet()
  }

  handleWhere() {
    var list = _listHelper();
    // Change the list with list.where()
  }
}
