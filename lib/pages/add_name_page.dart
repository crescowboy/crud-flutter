import 'package:flutter/material.dart';

class AddNamePage extends StatefulWidget {
  AddNamePage({Key? key}) : super(key: key);

  @override
  State<AddNamePage> createState() => _AddNamePageState();
}

class _AddNamePageState extends State<AddNamePage> {
  TextEditingController nameController = TextEditingController(text: "");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          child: Column(
            children: [
               TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Ingrese el nuevo nombre'
                ),
              ),
              ElevatedButton(onPressed: (){
                print(nameController.text);
              },
              child: const Text('Guardar'))
            ],
          ),
        ),
      )
    );
  }
}