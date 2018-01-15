import 'dart:html';

void main() {
  querySelectorAll('.panel-button').forEach((btn) {
    new PanelButtonController(btn.id);
  });
}

class PanelButtonController {
  final String btnId;
  String associatedPanelId;
  Element associatedButton;
  PanelController panel;

  PanelButtonController(this.btnId) {
    associatedPanelId = buildPanelId();
    associatedButton = querySelector('#$btnId');
    panel = new PanelController(associatedPanelId);
    associatedButton.onClick.listen((e) => openAssociatedPanel(e));
  }

  void openAssociatedPanel(e) {
    if (panel.isOpen) {
      panel.associatedPanel.classes.add("closed");
      panel.isOpen = false;
    } else {
      panel.associatedPanel.classes.remove("closed");
      panel.isOpen = true;
    }
  }

  String buildPanelId() {
    var buttonIdAsArray = btnId.split("-");
    buttonIdAsArray[buttonIdAsArray.length - 1] = "panel";
    return buttonIdAsArray.join('-');
  }
}

class PanelController {
  final String panelId;
  String baseId;
  bool isOpen;
  Element associatedPanel;
  ElementList<InputElement> childrenInputs;

  PanelController(this.panelId) {
    baseId = panelId.split("-").sublist(0, 2).join("-");
    associatedPanel = querySelector('#$panelId');
    childrenInputs = associatedPanel.querySelectorAll('input');
    isOpen = false;
    buildInputEventListeners();
  }

  buildInputEventListeners() {
    var htmlEl = querySelector('.$baseId');
    childrenInputs.forEach((input) {
      input.onKeyUp.listen((KeyboardEvent e) {
        if (e.keyCode == 13) {
          var cssProp = input.classes.first;
          htmlEl.style.setProperty(cssProp, input.value);
        }
      });
    });
  }
}
