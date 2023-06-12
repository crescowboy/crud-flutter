import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getPeople() async{
  List people = [];
  CollectionReference collectionReferencePeople = db.collection('people');

  QuerySnapshot queryPeople = await collectionReferencePeople.get();

  queryPeople.docs.forEach((documento) {
    people.add(documento.data());
   });

  return people;
}

// Guardar un name en la base de datos

Future<void> addPeople(String name) async{
  await db.collection('people').add({"name": name});
} 

//Actualizar un name en la base de datos

Future<void> updatePeople(String uid, String newName) async{
  await db.collection("people").doc(uid).set({"name": newName});

}

