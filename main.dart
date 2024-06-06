import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 11',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void _showMaterialAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Boton 01 - Material'),
        content: Text('Descripcion'),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  void _showMaterialAlertWithOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Boton 02 - Material con opciones'),
        content: Text('Descripcion'),
        actions: [
          TextButton(
            child: Text('Cancelar'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  void _showCupertinoAlert(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text('Boton 01 - Cupertino'),
        content: Text('Descripcion'),
        actions: [
          CupertinoDialogAction(
            child: Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  void _showCupertinoAlertWithOptions(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text('Boton 02 - Material'),
        content: Text('Descripcion'),
        actions: [
          CupertinoDialogAction(
            child: Text('Cancelar'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          CupertinoDialogAction(
            child: Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alertas de botones.'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _showMaterialAlert(context),
              child: Text('Boton 01 - Material'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showMaterialAlertWithOptions(context),
              child: Text('Boton 02 - Material'),
            ),
            SizedBox(height: 40),
            TextButton(
              onPressed: () => _showCupertinoAlert(context),
              child: Text('Boton 01 - Cupertino'),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () => _showCupertinoAlertWithOptions(context),
              child: Text('Boton 02 - Cupertino'),
            ),
          ],
        ),
      ),
    );
  }
}
