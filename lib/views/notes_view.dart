import 'package:flutter/material.dart';
import 'package:notes_app/views/coustem_note.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Notes', style: TextStyle(fontSize: 30)),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.search, size: 35),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 4 ,
              itemBuilder: (context, index){
               return  CoustemNote();
              }),
          ),

          // CoustemNote(),

      ]),
    );
  }
}

 