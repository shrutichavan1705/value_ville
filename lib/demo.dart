import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> _values = [
    'Social Values',
    'Personal Values',
    'Interpersonal Values',
    'Environmental Values',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo'),
        ),
        body: Center(
          child:ListView(
            children: [
              ListTile(
                leading: Image(image: AssetImage('assets/svDashimg.jpg'),
                  width: 270,
                  height: 130,
                fit: BoxFit.fill,),
                title: Text('Social Value'),
              )
            ],
          ),
        )
    );
  }
}