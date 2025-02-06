import 'package:clean_note_app/common/show_messages/show_error_message.dart';
import 'package:clean_note_app/common/show_messages/show_success_message.dart';
import 'package:clean_note_app/common/style/decorations/text_field_decoration.dart';
import 'package:clean_note_app/common/validations/validations.dart';
import 'package:clean_note_app/features/create_note/presentation/provider/create_note_provider.dart';
import 'package:clean_note_app/features/create_note/presentation/ui/widget/cancel_button.dart';
import 'package:clean_note_app/features/create_note/presentation/ui/widget/create_note_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateNoteScreen extends ConsumerStatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateNoteScreenState();
}

class _CreateNoteScreenState extends ConsumerState<CreateNoteScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _titleController;
  late TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _contentController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _listener();

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
                  // Title
                  TextFormField(
                    textAlign: TextAlign.right,
                    decoration: TextFieldDecoration.fieldDecoration(
                      size,
                      context,
                      'العنوان',
                      null,
                      null,
                      null,
                    ),
                    controller: _titleController,
                    validator: Validations.validatetemplate,
                  ),
                  SizedBox(height: size.height * 0.02),

                  // Content
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
                    validator: Validations.validatetemplate,
                  ),
                  SizedBox(height: size.height * 0.02),

                  // Button
                  CreateNoteButton(onPressed: _createNote),

                  // Cancel
                  CancelButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _createNote() {
    if (_formKey.currentState!.validate()) {
      final formData = {
        "title": _titleController.text,
        "note_content": _contentController.text,
      };
      ref.read(createNoteProvider.notifier).setNoteForm(formData);
      ref.read(createNoteProvider.notifier).createNote();
    }
  }

  void _listener() {
    ref.listen(createNoteProvider.select((value) => value.errorMessage),
        (_, next) {
      if (next != null) {
        ShowErrorMessage.showMessage(context, next);
      }
    });

    ref.listen(createNoteProvider.select((value) => value.isSuccess),
        (_, next) {
      if (next) {
        ShowSuccessMessage.showMessage(context, "تم انشاء الملاحظة بنجاح!");
        Navigator.pop(context);
      }
    });
  }
}
