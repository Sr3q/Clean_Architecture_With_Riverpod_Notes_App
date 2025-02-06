import 'package:clean_note_app/common/models/note_model.dart';
import 'package:clean_note_app/common/show_messages/show_error_message.dart';
import 'package:clean_note_app/common/show_messages/show_success_message.dart';
import 'package:clean_note_app/common/style/decorations/text_field_decoration.dart';
import 'package:clean_note_app/features/delete_update_note/presentation/provider/delete_note_provider.dart';
import 'package:clean_note_app/features/delete_update_note/presentation/provider/update_note_provider.dart';
import 'package:clean_note_app/features/delete_update_note/presentation/ui/widget/delete_note_button.dart';
import 'package:clean_note_app/features/delete_update_note/presentation/ui/widget/update_note_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateDeleteScreen extends ConsumerStatefulWidget {
  const UpdateDeleteScreen({super.key, required this.note});

  final NoteModel note;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UpdateDeleteScreenState();
}

class _UpdateDeleteScreenState extends ConsumerState<UpdateDeleteScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note.title);
    _contentController = TextEditingController(text: widget.note.content);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _updateNoteLisener();
    _deleteNoteLisener();

    final size = MediaQuery.of(context).size;

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 5,
            margin: EdgeInsets.only(
              left: size.width * 0.11,
              right: size.width * 0.11,
            ),
            child: Padding(
              padding: EdgeInsets.all(size.width * 0.05),
              child: Column(
                children: [
                  TextFormField(
                    textAlign: TextAlign.right,
                    decoration: TextFieldDecoration.fieldDecoration(
                      size,
                      context,
                      "العنوان",
                      null,
                      null,
                      null,
                    ),
                    controller: _titleController,
                    // validator: validator,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  TextFormField(
                    textAlign: TextAlign.right,
                    decoration: TextFieldDecoration.fieldDecoration(
                      size,
                      context,
                      null,
                      null,
                      null,
                      null,
                    ),
                    maxLines: 10,
                    minLines: 5,
                    controller: _contentController,
                    // validator: validator,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  // update button
                  UpdateNoteButton(onPressed: _updateNote),

                  // delete button
                  DeleteNoteButton(onPressed: _deleteNote),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _updateNote() {
    if (_formKey.currentState!.validate()) {
      final formData = {
        'id': widget.note.id,
        "title": _titleController.text,
        "note_content": _contentController.text,
      };

      ref.read(updateNoteProvider.notifier).setNoteForm(formData);

      ref.read(updateNoteProvider.notifier).updateNote();
    }
  }

  void _updateNoteLisener() {
    ref.listen(updateNoteProvider.select((value) => value.isSuccess),
        (_, next) {
      if (next) {
        ShowSuccessMessage.showMessage(context, "تم تعديل الملاحظة بنجاح!");
        Navigator.pop(context);
      }
    });

    ref.listen(updateNoteProvider.select((value) => value.errorMessage),
        (_, next) {
      if (next != null) {
        ShowErrorMessage.showMessage(context, next);
      }
    });
  }

  void _deleteNote() {
    ref.read(deleteNoteProvider.notifier).deleteNote(widget.note.id);
  }

  void _deleteNoteLisener() {
    ref.listen(deleteNoteProvider.select((value) => value.isSuccess),
        (_, next) {
      if (next) {
        ShowSuccessMessage.showMessage(context, "تم حذف الملاحظة بنجاح!");
        Navigator.pop(context);
      }
    });

    ref.listen(deleteNoteProvider.select((value) => value.errorMessage),
        (_, next) {
      if (next != null) {
        ShowErrorMessage.showMessage(context, next);
      }
    });
  }
}
