import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({ Key? key }) : super(key: key);

  void loadCountries() async{
       String data = await rootBundle.loadString("assets/files/countries.tsv");
       List<String> listSplite = data.split("row");
      log("${listSplite.length}");
       
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Countries"),
      ),
      body: Center(
        child: InkWell(
          onTap: () => log("Image Event Click"),
          borderRadius: BorderRadius.circular(50),
          splashColor: Colors.green,
          highlightColor: Colors.green,

          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset("assets/images/profile.jpg", height: 100, width: 100,),
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "profile");
        },
        child: const Icon(Icons.download),
      ),
    );
      
    
  }
}