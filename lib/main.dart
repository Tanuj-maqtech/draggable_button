import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Draggable Buttons',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DraggableButtonsPage(),
    );
  }
}

class DraggableButtonsPage extends StatefulWidget {
  @override
  _DraggableButtonsPageState createState() => _DraggableButtonsPageState();
}

class _DraggableButtonsPageState extends State<DraggableButtonsPage> {
  Offset button1Position = Offset(50, 100);
  Offset button2Position = Offset(150, 100);
  Offset button3Position = Offset(250, 100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Draggable Buttons'),
      ),
      body: Stack(
        children: [
          Positioned(
            left: button1Position.dx,
            top: button1Position.dy,
            child: Draggable(
              data: 'Button1',
              child: buildButton('Button 1'),
              feedback: buildButton('Button 1', isDragging: true),
              onDraggableCanceled: (velocity, offset) {
                setState(() {
                  button1Position = offset;
                });
              },
              childWhenDragging: Container(),
            ),
          ),
          Positioned(
            left: button2Position.dx,
            top: button2Position.dy,
            child: Draggable(
              data: 'Button2',
              child: buildButton('Button 2'),
              feedback: buildButton('Button 2', isDragging: true),
              onDraggableCanceled: (velocity, offset) {
                setState(() {
                  button2Position = offset;
                });
              },
              childWhenDragging: Container(),
            ),
          ),
          Positioned(
            left: button3Position.dx,
            top: button3Position.dy,
            child: Draggable(
              data: 'Button3',
              child: buildButton('Button 3'),
              feedback: buildButton('Button 3', isDragging: true),
              onDraggableCanceled: (velocity, offset) {
                setState(() {
                  button3Position = offset;
                });
              },
              childWhenDragging: Container(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(String text, {bool isDragging = false}) {
    return Container(
      width: 100,
      height: 50,
      decoration: BoxDecoration(
        color: isDragging ? Colors.blue.withOpacity(0.5) : Colors.blue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}