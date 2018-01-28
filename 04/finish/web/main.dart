import 'dart:html';

void main() {
  var menuChapters = document.querySelectorAll('li > a');
  window.addEventListener("scroll", (e) => onScroll(e, menuChapters));
  menuChapters.forEach((link) {
    link.addEventListener('click', (e) => handleClick(e, link));
  });
}

void handleClick(MouseEvent e, Element link) {
  var currentActive = document.querySelector(".active-chapter");
  currentActive.classes.remove('active-chapter');
  link.classes.add('active-chapter');
}

void onScroll(CustomEvent e, List<Element> menuChapters) {
  var scrollPos = window.pageYOffset;
  print('Scroll Pos of Y: $scrollPos');
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
