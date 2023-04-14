import 'package:flutter/material.dart';
import 'package:p1/login.dart';

import 'modelo.dart';

class item extends StatelessWidget {
  final mda todo;
  final mda tipo;
  final mda fecha;
  final onToDoChanged;
  final onDeleteItem;

  const item({
    Key? key,
    required this.todo,
    required this.tipo,
    required this.fecha,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
          onToDoChanged(tipo);
          onToDoChanged(fecha);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5.7),
        tileColor: Colors.white,
        leading: Icon(
          todo.realizado ? Icons.check_box : Icons.check_box_outline_blank,
          color: HexColor.fromHex("FF5F5F52EE"),
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            //volver bold el texto
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: HexColor.fromHex("FF3A3A3A"),
            decoration: todo.realizado ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              todo.tipo!,
              style: TextStyle(
                fontSize: 13,
                color: HexColor.fromHex("FF3A3A3A"),
                decoration: todo.realizado ? TextDecoration.lineThrough : null,
              ),
            ),
            Text(
              todo.fecha!,
              style: TextStyle(
                fontSize: 12,
                color: HexColor.fromHex("FF3A3A3A"),
                decoration: todo.realizado ? TextDecoration.lineThrough : null,
              ),
            ),
          ],
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: HexColor.fromHex("FF5DA4040"),
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              onDeleteItem(todo.id);
            },
          ),
        ),
      ),
    );
  }
}
