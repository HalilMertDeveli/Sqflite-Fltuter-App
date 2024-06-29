import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
class HomePage extends StatelessWidget{
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("it is app bar"),
      ),
      body: Column(
        children: [
          TextField(
            controller: textController,
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: (){
            print(textController.text);
        },
      ),
    );
  }

}