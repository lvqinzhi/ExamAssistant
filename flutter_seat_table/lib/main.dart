import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ClassSeatsPage(),
    );
  }
}

class ClassSeatsPage extends StatefulWidget {
  const ClassSeatsPage({Key? key}) : super(key: key);

  @override
  _ClassSeatsPageState createState() => _ClassSeatsPageState();
}

class _ClassSeatsPageState extends State<ClassSeatsPage> {
  final List<String> _list = [
    '1号',
    '2号',
    '3号',
    '4号',
    '5号',
    '6号',
    '7号',
    '8号',
    '9号',
    '10号',
    '11号',
    '12号',
    '13号',
    '14号',
    '15号',
    '16号',
    '17号',
    '18号',
    '19号',
    '20号',
    '21号',
    '22号',
    '23号',
    '24号',
    '25号',
    '26号',
    '27号',
    '28号',
    '29号',
    '30号'
  ];

  List<Widget> _getWidget() {
    return _list
        .map((str) => Card(
              elevation: 3,
              child: Container(
                padding: const EdgeInsets.only(top: 10),
                width: 60,
                height: 40,
                child: Text(
                  str,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 88),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  elevation: 3,
                  child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    width: 60,
                    height: 40,
                    child: const Text(
                      '讲台',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
            Wrap(
              spacing: 5,
              runAlignment: WrapAlignment.center,
              runSpacing: 5.0,
              children: _getWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
