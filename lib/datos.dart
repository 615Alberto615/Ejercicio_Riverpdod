import 'package:flutter/material.dart';
import 'modelo2.dart';

class EtiquetasProvider extends ChangeNotifier {
  final lista = ex.listaex();
  List<ex> _bb = [];

  EtiquetasProvider() {
    _bb = lista;
  }

  List<ex> get bb => _bb;

  void deleteItem(String id) {
    lista.removeWhere((element) => element.id == id);
    _bb = lista.toList();
    notifyListeners();
  }

  void addTodo(String text) {
    lista.add(ex(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      texto: text,
    ));
    _bb = lista.toList();
    notifyListeners();
  }
}
