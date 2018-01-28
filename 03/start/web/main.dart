import 'dart:html';

void main() {
  querySelectorAll('.panel-button').forEach((btn) {
    new PanelButtonController();
  });
}

class PanelButtonController {
  PanelButtonController();

  void openAssociatedPanel(e) {}

  String buildPanelId() {}
}

class PanelController {
  PanelController();

  void buildInputEventListeners() {}
}
