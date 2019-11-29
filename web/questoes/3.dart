import 'dart:html';

import 'package:lpweb_lista/lib_helpers.dart';

void main() {
  querySelector('#addButton').onClick.listen((event) {
    event.preventDefault();
    InputElement txtIdade = querySelector('#input');
    String nome = txtIdade.value;
    print(nome);
    (querySelector('#output') as TableElement).insertRow(1)
      ..addCell().text = nome
      ..addCell().append(ButtonElement()
        ..innerHtml = '<i class="fas fa-ban"></i>'
        ..onClick.listen((e) {
          deleteRowListener(e);
        }));
  });
}
