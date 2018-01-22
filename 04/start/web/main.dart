import 'dart:html';
import 'dart:async';

void main() {
  var menuChapters = document.querySelectorAll('li > a');
  var chapterLinks = querySelectorAll('nav > ul li a');

  window.addEventListener("scroll", (e) => onScroll(e, menuChapters));
}

void onScroll(CustomEvent e, List<Element> menuChapters) {}
