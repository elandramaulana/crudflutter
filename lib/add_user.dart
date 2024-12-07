import 'package:belajar/controller/user_controller.dart';
import 'package:belajar/models/user_model.dart';
import 'package:flutter/material.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();
  final UserController userController = UserController();
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: 
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
             TextField(
              controller: jobController,
              decoration: const InputDecoration(labelText: 'Job'),
            ),
        
            ElevatedButton(onPressed: (){
              String name = nameController.text;
              String job = jobController.text;
              userController.createUser(context, name, job);
            }, child: const Text('Create'))
          ],
        ),
      ),),
    );
  }
}