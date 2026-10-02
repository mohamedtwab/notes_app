import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';

class CustomNote extends StatelessWidget {
  final NoteModel note;
  final int colorcard;
  const CustomNote({super.key, required this.note, required this.colorcard});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(colorcard) ,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 12,
            bottom: 32,
            top: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  note.title,
                  style: TextStyle(color: Colors.black, fontSize: 32),
                ),
                subtitle: Text(
                  note.content,
                  style: TextStyle(
                    color: Colors.black.withOpacity(.5),
                    fontSize: 22,
                  ),
                ),
                isThreeLine: true,
                trailing: Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 30),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      note.delete();
                      },
                    icon: Icon(Icons.delete, color: Colors.black, size: 30),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  note.date,
                  style: TextStyle(
                    color: Colors.black.withOpacity(.5),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
