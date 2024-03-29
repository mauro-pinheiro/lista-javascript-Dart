import 'dart:html';

import 'package:lpweb_lista/lib_helpers.dart';

void atualizaContagem() {
  var idades = (querySelector('#output') as TableElement)
      .rows
      .map((r) => r.cells[0].text)
//      .map((r) => r.cells)
//      .map((c) => c.elementAt(0))
//      .map((c) => c.text)
      .where((c) => int.tryParse(c) != null)
      .toList();
  var maior = idades.where((i) => int.tryParse(i) >= 18).length;
  var menor = idades.where((i) => int.tryParse(i) < 18).length;

  (querySelector("#conta-maior-18") as InputElement).value = '$maior';
  (querySelector("#conta-menor-18") as InputElement).value = '$menor';
}

void main() {
  querySelector('#addButton').onClick.listen((event) {
    event.preventDefault();
    InputElement txtIdade = querySelector('#input');
    double idade = double.tryParse(txtIdade.value);
    print(idade);
    (querySelector('#output') as TableElement).addRow()
      ..addCell().text = "$idade"
      ..addCell().append(ButtonElement()
        ..innerHtml = '<i class="fas fa-ban"></i>'
        ..onClick.listen((e) {
          deleteRowListener(e);
          atualizaContagem();
        }));
    atualizaContagem();
  });
}
