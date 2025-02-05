import 'package:clean_note_app/common/exception/failure.dart';
import 'package:clean_note_app/features/create_note/application/services/icreate_note_service.dart';
import 'package:clean_note_app/features/create_note/data/dto/request/create_note_request.dart';
import 'package:clean_note_app/features/create_note/data/dto/response/create_note_response.dart';
import 'package:clean_note_app/features/create_note/data/repository/icreate_note_repository.dart';
import 'package:clean_note_app/features/home/application/models/note_model.dart';
import 'package:multiple_result/multiple_result.dart';

final class CreateNoteService implements ICreateNoteService {
  final ICreateNoteRepository _repository;

  CreateNoteService(this._repository);

  @override
  Future<Result<NoteModel, Failure>> createNote(
      CreateNoteRequest request) async {
    try {
      final response = await _repository.createNote(request);
    } on Failure catch (e) {
      return Error(e);
    } catch (e, s) {
      return Error(
        Failure(
          message: e.toString(),
          exception: e as Exception,
          stackTrace: s,
        ),
      );
    }
  }

  NoteModel _toNoteModel(CreateNoteResponse response) {
    return NoteModel(
      id: response.note.id,
      title: response.note.title,
      content: response.note.content,
      createdAt: response.note.createdAt,
      updatedAt: response.note.updatedAt,
    );
  }
}
