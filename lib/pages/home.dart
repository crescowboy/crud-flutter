import 'package:crud/services/firebase_service.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: FutureBuilder<List>(
        future: getPeople(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  onDismissed: (direction){
                    
                  },
                  confirmDismiss: (direction) async{
                    bool result = false;
                    result = await showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text("Estas seguro de eliminar a ${snapshot.data?[index]["name"]}"),
                          actions: [
                            TextButton(onPressed: (){
                              return Navigator.pop(
                                context,
                                false,
                                );
                            }, child: const Text("Cancelar",
                              style: TextStyle(color: Colors.red),
                            )),

                            TextButton(onPressed: (){
                              return Navigator.pop(
                                context,
                                true,
                                );
                            }, child: Text("Si"))
                          ],
                        );
                      });
                    return result;
                  },
                  background: Container(
                    child: const Icon(Icons.delete),
                    color: Colors.red,
                  ),
                  direction: DismissDirection.startToEnd,
                  key: Key(snapshot.data?[index]["uid"]),
                  child: ListTile(
                    title: Text(snapshot.data?[index]['name']),
                    onTap: (() async{
                      await Navigator.pushNamed(context, "/edit", arguments: {
                        "name": snapshot.data?[index]["name"],
                        "uid": snapshot.data?[index]["uid"],
                      });
                      setState(() {});
                    }),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            ); 
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          await Navigator.pushNamed(context, '/add');
          setState(() {});
        },
        child: const Icon(Icons.add),
        ),
    );
  }
}
