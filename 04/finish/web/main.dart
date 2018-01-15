import 'dart:html';
import 'dart:async';

void main() {
  var menuChapters = document.querySelectorAll('li > a');
  window.addEventListener("scroll", (e) => onScroll(e, menuChapters));

  var chapterLinks = querySelectorAll('nav > ul li a');
  chapterLinks.forEach((link) {
    link.addEventListener('click', (e) {
      var currentActive = document.querySelector(".active-chapter");
      currentActive.classes.remove('active-chapter');
      link.classes.add('active-chapter');
    });
  });
}

void onScroll(CustomEvent e, List<Element> menuChapters) {
  var scrollPos = window.pageYOffset;
  menuChapters.forEach((chapter) {
    var currentActive = document.querySelector(".active-chapter");
    var ref = chapter.getAttribute("href");
    var correspondingElement = querySelector('$ref');
    var eleTopPos = correspondingElement.documentOffset.y;
    var eleBottomPos = eleTopPos + correspondingElement.offsetHeight;
    if (scrollPos > eleTopPos && scrollPos < eleBottomPos) {
      currentActive.classes.remove('active-chapter');
      chapter.classes.add('active-chapter');
    }
  });
}
