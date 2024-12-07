import 'package:belajar/add_user.dart';
import 'package:belajar/controller/news_controller.dart';
import 'package:belajar/models/news_model.dart';
import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
   MyHome({super.key});


  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
    final NewsController controller = NewsController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AddUserPage()),
    );
    }
    ),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('My Home'),
      ),
      
      body: FutureBuilder<List<NewsModel>>(
      future: controller.fetchNews(country: 'us'),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (snapshot.hasData) {
          final newslists = snapshot.data!;
          return ListView.builder(
            itemCount: newslists.length, 
            itemBuilder: (context, index) {
              final newslist = newslists[index];
              return Card(
                child: ListTile(
                leading: newslist.imageUrl.isNotEmpty
                    ? Image.network(newslist.imageUrl, width: 100, height: 100, fit: BoxFit.cover)
                    : null,
                title: Text(newslist.title),
              ),

              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ),

    );
  }
}