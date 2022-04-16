import 'package:flutter/material.dart';
import 'package:flutter_skills_test/screens/vehicles/vahicle_list_ui.dart';
import 'package:flutter_skills_test/utils/utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: <String, WidgetBuilder>{
        Vehicles.tag: (BuildContext context) => Vehicles()
      },
      home: MyHomePage(title: 'Flutter Skills Set'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: RaisedButton(
            //     disabledColor: Colors.red,
            // disabledTextColor: Colors.black,
            padding: const EdgeInsets.all(20),
            textColor: Colors.white,
            color: Colors.green,
            onPressed: () {
              launchScreen(context, Vehicles.tag);
            },
            child: Text('Show Vehicles'),
          ),
        ));
  }
}
