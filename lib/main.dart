import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:p1/eti.dart';
import 'package:p1/login.dart';
import 'package:p1/tareas.dart';
import 'datos.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: Colors.black,
      ),
      initialRoute: loginp.id,
      routes: {
        loginp.id: (context) => loginp(),
        TareasPage.id: (context) => TareasPage(),
        etiquetas.id: (context) => etiquetas(),
      },
    );
  }
}
