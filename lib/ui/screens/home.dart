import 'package:app_db/data/db_helper.dart';
import 'package:app_db/data/models/story.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  final String? title;
  const HomeScreen({ Key? key, this.title }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final DbHelper _dbHelper = DbHelper.instance;

  @override
  void initState() {
    super.initState();
  }
  
  Future<int> insertStory(Story story) async{
      final int id = await _dbHelper.insertStory(story);
     return id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),

      body: Center(
        child: ElevatedButton(
          onPressed: () async{
            Navigator.pushNamed(context, "countries");
          }, 
          child: const Text("Coutries")),
      ),
    );
  }
}