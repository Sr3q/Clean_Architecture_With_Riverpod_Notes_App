import 'package:clean_note_app/features/home/data/dto/response/get_notes_respnse.dart';

abstract interface class IGetNotesRepository {
  Future<GetNotesRespnse> getNotes();
}
