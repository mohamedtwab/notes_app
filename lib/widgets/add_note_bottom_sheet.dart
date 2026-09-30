import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/models/note_model.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({super.key});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  void dispose() {
    // 3. تحرير الذاكرة وإعدام المتحكمات بمجرد إغلاق الشيت للحفاظ على الأداء
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                focusColor: Color(0xFF51E7D0),
                hintText: 'title',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF51E7D0)),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: contentController,
              maxLines: 8,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF51E7D0)),
                ),
                hintText: 'content',
              ),
            ),
            const SizedBox(height: 80),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF51E7D0),
                ),
                onPressed: () {
                  // 4. هندسة الحفظ: نأخذ البيانات من المتحكمات ونرسلها لـ Hive

                  // نتأكد أولاً أن الحقول غير فارغة
                  if (titleController.text.isNotEmpty &&
                      contentController.text.isNotEmpty) {
                    // تغليف البيانات في قالب NoteModel
                    var note = NoteModel(
                      title: titleController.text,
                      content: contentController.text,
                      date: DateTime.now().toString().substring(
                        0,
                        10,
                      ), // استخراج التاريخ فقط
                    );

                    // دفع القالب إلى الصندوق (الهارد ديسك + الرام)
                    Hive.box<NoteModel>('notes_box').add(note);

                    // إغلاق الشيت
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add', style: TextStyle(color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
