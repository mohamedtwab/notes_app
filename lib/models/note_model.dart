import 'package:hive/hive.dart';

// هذا السطر سيظهر تحته خط أحمر في البداية، لا تقلق سيختفي في الخطوة القادمة
part 'note_model.g.dart'; 

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String content;

  @HiveField(2)
  final String date;



  NoteModel({
    required this.title,
    required this.content,
    required this.date,
    
  });
}