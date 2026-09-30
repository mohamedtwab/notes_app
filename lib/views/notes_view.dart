import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/coustem_note.dart';
import 'package:notes_app/widgets/add_note_bottom_sheet.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});
  static const List<int> noteColors = [
    0xffFFCC80, // اللون الأول
    0xffE6EE9B, // اللون التاني
    0xff80DEEA, // اللون التالت
    0xffCF93D9, // اللون الرابع
    0xffF48FB1, // اللون الخامس
    // ضيف أي عدد ألوان إنت عايزه هنا بنفس الصيغة (0xff + الكود)
  ];
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return AddNoteBottomSheet();
            },
          );
        },
        backgroundColor: Colors.orangeAccent,
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: 4,
          //     itemBuilder: (context, index) {
          //       return CustomNote(note: ,);
          //     },
          //   ),
          // ),
          Expanded(
  child: ValueListenableBuilder<Box<NoteModel>>(
    // 1. بنراقب التغييرات اللي بتحصل في صندوق الملاحظات
    valueListenable: Hive.box<NoteModel>('notes_box').listenable(),
    
    builder: (context, box, child) {
      // 2. بنجيب كل الملاحظات اللي جوه الصندوق ونحطها في قائمة (List)
      List<NoteModel> notes = box.values.toList();

      return ListView.builder(
        // 3. بنخلي عدد العناصر على قد عدد الملاحظات اللي عندنا بالظبط
        itemCount: notes.length, 
        
        itemBuilder: (context, index) {
          int calculatedColor = noteColors[index % noteColors.length];
          // 4. بندي للـ CustomNote الملاحظة اللي عليها الدور من القائمة
          return CustomNote(
            note: notes[index],
            colorcard: calculatedColor , 
          );
        },
      );
    },
  ),
),

          // CoustemNote(),
        ],
      ),
    );
  }
}

