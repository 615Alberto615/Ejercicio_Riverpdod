import 'package:flutter/material.dart';

import 'login.dart';
import 'package:p1/etiitem.dart';
import 'package:p1/eti.dart';
import 'item.dart';
import 'package:p1/modelo.dart';
import 'modelo2.dart';
import 'datos.dart';

class TareasPage extends StatefulWidget {
  static const String id = 'tareas';
  TareasPage({Key? key}) : super(key: key);

  @override
  State<TareasPage> createState() => _TareasPageState();
}

class _TareasPageState extends State<TareasPage> {
  final lista = mda.lista();
  final lista2 = ex.listaex();
  final _todoController = TextEditingController();
  final _tipoController = TextEditingController();
  final _fechController = TextEditingController();
  List<mda> _bb = [];
  List<ex> _bb2 = [];

  final List<String> _tipoOptions = [];

  String? _selectedTipo;

  @override
  void initState() {
    // TODO: implement initState
    _bb = lista;
    _bb2 = ex.listaex();
    _mrd();

    /*_selectedTipo = _bb2[0].texto;
    _dropdownItems = [
      for (ex x in _bb2)
        DropdownMenuItem(
          value: x.texto,
          child: etiitem(
            todo: x,
            onDeleteItem: null,
            onToDoChanged: null,
          ),
        ),
    ];*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor.fromHex('#FFEEEFF5'),
      appBar: _buildAppBar(),
      body: Stack(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              busque(),
              Expanded(
                  child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50, bottom: 20),
                    child: Text(
                      'Lista de tareas',
                      style: TextStyle(
                        //color: HexColor.fromHex("20262E"),
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  for (mda todoo in _bb.reversed)
                    item(
                      todo: todoo,
                      tipo: todoo,
                      fecha: todoo,
                      onToDoChanged: _tar,
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
                            controller: _todoController,
                            decoration: InputDecoration(
                                hintText: "Añadir tarea",
                                border: InputBorder.none)),
                        Row(
                          children: [
                            Expanded(
                              child: DropdownButton<String>(
                                value: _selectedTipo,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedTipo = newValue;
                                  });
                                },
                                items: _tipoOptions
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    Navigator.pushNamed(context, etiquetas.id);
                                  });
                                },
                                child: Icon(
                                  Icons.edit,
                                  size: 15,
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: HexColor.fromHex("FF5F5F52EE"),
                                    fixedSize: Size(5, 0.5))),
                          ],
                        ),
                        TextField(
                            controller: _fechController,
                            decoration: InputDecoration(
                                hintText: "Añadir Fecha",
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
                  _addtodo(_todoController.text);
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

  void _tar(mda todo) {
    setState(() {
      todo.realizado = !todo.realizado;
    });
  }

  void _deleteItem(String id) {
    setState(() {
      lista.removeWhere((element) => element.id == id);
    });
  }

  void _mrd() {
    setState(() {
      _tipoOptions.clear(); // Limpiar lista para evitar duplicados
      for (ex x in _bb2) {
        if (x.texto != null) {
          _tipoOptions.add(x.texto!);
        }
      }
    });
  }

  void _addtodo(String x) {
    setState(() {
      final selectedTipo = _selectedTipo ??
          ''; // Si _selectedTipo es nulo, se asigna una cadena vacía
      _bb.add(mda(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: _todoController.text,
        tipo: selectedTipo,
        fecha: _fechController.text,
        realizado: false,
      ));
    });
    _todoController.clear();
    _tipoController.clear();
    _fechController.clear();
  }

  void _filtro(String key) {
    List<mda> x = [];
    if (key.isEmpty) {
      x = lista;
    } else {
      x = lista
          .where((element) =>
              element.todoText!.toLowerCase().contains(key.toLowerCase()))
          .toList();
    }
    setState(() {
      _bb = x;
    });
  }

  Widget busque() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _filtro(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: HexColor.fromHex("FF3A3A3A"),
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 25,
            minHeight: 20,
          ),
          border: InputBorder.none,
          hintText: 'Buscar',
          hintStyle: TextStyle(
            color: HexColor.fromHex("FF717171"),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: HexColor.fromHex('#FFEEEFF5'),
      elevation: 0,
      automaticallyImplyLeading: false, //flechita hacia atras
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: HexColor.fromHex("FF3A3A3A"),
            size: 30,
          ),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('media/user.png'),
            ),
          ),
        ],
      ),
    );
  }
}
// me guie en el video https://www.youtube.com/watch?v=K4P5DZ9TRns