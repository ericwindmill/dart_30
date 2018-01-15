import 'dart:html';
import 'dart:async';

void main() {
  var menuChapters = document.querySelectorAll('li > a');
  window.addEventListener("scroll", (e) => onScroll(e, menuChapters));
}

EventListener onScroll(Event e, List<Element> menuChapters) {
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

class HeadingController {
  final List<Element> menuChapters;
  final Element section;
  int topYpos;
  int bottomYpos;

  HeadingController(this.section, this.menuChapters) {
    topYpos = section.documentOffset.y;
    bottomYpos = section.documentOffset.y + section.offsetHeight;
    var halfSec = new Duration(milliseconds: 500);
    new Timer.periodic(halfSec, (Timer t) => listenForScrollChange());
  }

  listenForScrollChange() {
    if (window.pageYOffset > topYpos && window.pageYOffset < bottomYpos) {
      print(window.pageYOffset > topYpos && window.pageYOffset < bottomYpos);
      String navId = getCorrespondingId(section);
      var navLi = querySelector('#$navId');
      var currentActive = querySelector('.active-chapter');
      print(currentActive.text);
      currentActive.classes.remove('active-chapter');
      navLi.classes.add('eactive-chapter');
    }
  }

  String getCorrespondingId(Element el) {
    return el.id.split("-")[1];
  }
}
