import 'package:flutter/material.dart';

import 'modelo2.dart';
import 'login.dart';
import 'etiitem.dart';

class etiquetas extends StatefulWidget {
  static const String id = 'eti';
  etiquetas({super.key});

  @override
  State<etiquetas> createState() => _etiquetasState();
}

class _etiquetasState extends State<etiquetas> {
  final lista = ex.listaex();
  final _etiController = TextEditingController();
  List<ex> _bb = [];

  @override
  void initState() {
    // TODO: implement initState
    _bb = lista;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_bb.isEmpty) {
      _bb = List<ex>.from(lista);
    }

    return Scaffold(
      backgroundColor: HexColor.fromHex('#FFEEEFF5'),
      appBar: _buildAppBar(),
      body: Stack(children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              Expanded(
                  child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      'Lista de Etiquetas',
                      style: TextStyle(
                        //color: HexColor.fromHex("20262E"),
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  for (ex todoo in _bb.reversed)
                    etiitem(
                      todo: todoo,
                      onDeleteItem: _deleteItem,
                    ),
                ],
              ))
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(children: [
            Expanded(
                child: Container(
                    margin: EdgeInsets.only(
                      left: 20,
                      right: 10,
                      bottom: 20,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                            offset: Offset(0, 0),
                            spreadRadius: 0.0),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                            controller: _etiController,
                            decoration: InputDecoration(
                                hintText: "Añadir etiqueta",
                                border: InputBorder.none)),
                      ],
                    ))),
            Container(
              margin: EdgeInsets.only(
                right: 20,
                bottom: 20,
              ),
              child: ElevatedButton(
                onPressed: () {
                  _addtodo(_etiController.text);
                },
                child: Icon(
                  Icons.add,
                  size: 24,
                ),
                style: ElevatedButton.styleFrom(
                    primary: HexColor.fromHex("FF5F5F52EE"),
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(15),
                    elevation: 10),
              ),
            )
          ]),
        )
      ]),
    );
  }

  void _deleteItem(String id) {
    setState(() {
      lista.removeWhere((element) => element.id == id);
      _bb = lista.toList();
    });
  }

  void _addtodo(String x) {
    setState(() {
      lista.add(ex(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        texto: _etiController.text,
      ));
      _bb = lista.toList();
    });
    _etiController.clear();
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: HexColor.fromHex('#FFEEEFF5'),
      elevation: 0,
      iconTheme: IconThemeData(color: HexColor.fromHex("FF3A3A3A")),
      //automaticallyImplyLeading: false, //flechita hacia atras
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.tag,
            color: HexColor.fromHex("FF3A3A3A"),
            size: 0,
          ),
          Container(
            height: 30,
            width: 30,
            child: ClipRRect(
              //borderRadius: BorderRadius.circular(20),
              child: Image.asset('media/tag.png'),
            ),
          ),
        ],
      ),
    );
  }
}
