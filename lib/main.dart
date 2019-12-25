import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Animations'),
    );
  }
}

class AnimatedBuilderClass {
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 10),
              child: Text(
                'AnimatedContainer\nAnimatedDefaultTextStyle',
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: Center(
                child: AnimatedContainer(
                  color: selected ? Colors.red : Colors.blue,
                  alignment: selected ? Alignment.center : AlignmentDirectional.topCenter,
                  duration: Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 40),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: FlutterLogo(size: selected ? 100 : 75, colors: selected ? Colors.blue : Colors.red,),
                        ),
                        AnimatedDefaultTextStyle(
                          style: TextStyle(
                            color:  selected ? Colors.blue : Colors.red,
                            fontSize: 20,
                          ),
                          duration: Duration(seconds: 1),
                          child: Text(selected ? 'Toque para visualizar o quadro completo' : 'Visualizando o quadro completo'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.pushNamed(context, '/second')
        },
        tooltip: 'Increment Counter',
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
