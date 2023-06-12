import 'package:crud/services/firebase_service.dart';
import 'package:flutter/material.dart';

class EditNamePage extends StatefulWidget {
  EditNamePage({Key? key}) : super(key: key);

  @override
  State<EditNamePage> createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {
  TextEditingController nameController = TextEditingController(text: "");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        
          child: Column(
            children: [
               TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Ingrese la modificacion'
                ),
              ),
              ElevatedButton(
                onPressed: () async{
                  await addPeople(nameController.text).then((_) {
                    Navigator.pop(context);
                  });
                 
              },
              child: const Text('Actualizar'))
            ],
          ),
      )
    );
  }
}