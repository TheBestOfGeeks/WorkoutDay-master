

import '../../domain/repository/add_program_repository.dart';
import '../firestore_service.dart';

class AddProgramRepositoryImpl implements AddProgramRepository {
  DatabaseService _databaseService = DatabaseService.empty();

  @override
  delete(idOfProgram) {
    _databaseService.deleteProgram(idOfProgram: idOfProgram);
  }

  @override
  save(_nameOfProgram) {
    _databaseService.addProgram(nameOfProgram: _nameOfProgram);
  }
}
