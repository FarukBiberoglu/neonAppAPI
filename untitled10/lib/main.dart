import 'package:flutter/material.dart';
import 'package:untitled10/model/user_model.dart';
import 'package:untitled10/service/user_service.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserService _service = UserService();

  List<Data> users= [];

  @override
  void initState() {

    super.initState();
    _service.fetchUsers().then((value){
      if(value !=null && value.data != null){
        setState(() {
          users = value.data!;

        });
      }else {

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Scaffold(
        appBar: AppBar(
          title: Text('API',style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text('${users[index].firstName!+ users[index].lastName!}'),
              subtitle: Text(users[index].email!),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(users[index].avatar!),
              ),
            );
          },
        )
      ),
    );
  }
}

