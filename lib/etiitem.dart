import 'package:flutter/material.dart';
import 'package:p1/login.dart';

import 'modelo2.dart';

class etiitem extends StatelessWidget {
  final ex todo;

  final onDeleteItem;

  const etiitem({
    Key? key,
    required this.todo,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          //onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5.7),
        tileColor: Colors.white,
        title: Text(
          todo.texto!,
          style: TextStyle(
            //volver bold el texto
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: HexColor.fromHex("FF3A3A3A"),
          ),
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
