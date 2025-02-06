import 'package:clean_note_app/common/models/note_model.dart';
import 'package:clean_note_app/common/style/decorations/text_field_decoration.dart';
import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final NoteModel note;

  const NoteCard({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        // showDialog(
        //   useSafeArea: true,
        //   context: context,
        //   builder: (context) => Dialog(
        //     backgroundColor: Colors.transparent,
        //     alignment: Alignment.center,
        //     insetPadding: EdgeInsets.zero,
        //     child: UpdateDeleteNoteCard(note: note),
        //   ),
        // );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        margin: EdgeInsets.only(
          left: size.width * 0.11,
          right: size.width * 0.11,
          top: size.height * 0.03,
        ),
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Column(
            children: [
              TextFormField(
                textAlign: TextAlign.right,
                initialValue: note.title,
                enabled: false,
                style: Theme.of(context).textTheme.bodySmall,
                decoration: TextFieldDecoration.fieldDecoration(
                  size,
                  context,
                  "العنوان",
                  null,
                  null,
                  null,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              TextFormField(
                textAlign: TextAlign.right,
                initialValue: note.content,
                enabled: false,
                maxLines: 10,
                minLines: 5,
                style: Theme.of(context).textTheme.bodySmall,
                decoration: TextFieldDecoration.fieldDecoration(
                  size,
                  context,
                  null,
                  null,
                  null,
                  null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
