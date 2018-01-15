import 'dart:html';

void main() {
  querySelectorAll('.panel-button').forEach((btn) {
    new PanelButtonController();
  });
}

class PanelButtonController {
  PanelButtonController();

  void openAssociatedPanel(e) {}

  String buildPanelId() {
    // Change this. Only included to get linter to shush.
    return "";
  }
}

class PanelController {
  PanelController();

  void buildInputEventListeners() {}
}
