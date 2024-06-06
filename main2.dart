import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material vs Cupertino',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _materialSwitchValue = false;
  bool _cupertinoSwitchValue = false;
  double _materialSliderValue = 0.0;
  DateTime _cupertinoDate = DateTime.now();

  void _showCupertinoDatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 200,
                child: CupertinoDatePicker(
                  initialDateTime: _cupertinoDate,
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (DateTime newDateTime) {
                    setState(() {
                      _cupertinoDate = newDateTime;
                    });
                  },
                ),
              ),
              CupertinoButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material vs Cupertino'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Material',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Switch(
              value: _materialSwitchValue,
              onChanged: (bool value) {
                setState(() {
                  _materialSwitchValue = value;
                });
              },
            ),
            Slider(
              value: _materialSliderValue,
              onChanged: (double value) {
                setState(() {
                  _materialSliderValue = value;
                });
              },
            ),
            SizedBox(height: 40),
            Text(
              'Cupertino',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            CupertinoSwitch(
              value: _cupertinoSwitchValue,
              onChanged: (bool value) {
                setState(() {
                  _cupertinoSwitchValue = value;
                });
              },
            ),
            CupertinoButton(
              child: Text('Cupertino Date Picker'),
              onPressed: () => _showCupertinoDatePicker(context),
            ),
            SizedBox(height: 20),
            Text(
              'Selected Date: ${_cupertinoDate.toLocal()}'.split(' ')[0],
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
