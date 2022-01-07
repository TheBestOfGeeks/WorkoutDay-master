import 'package:workoutday/core/domain/repository/add_program_repository.dart';

import '../firestore_service.dart';

class AddProgramRepositoryImpl implements AddProgramRepository {
  DatabaseService _databaseService = DatabaseService();

  @override
  delete(idOfProgram) {
    _databaseService.deleteProgram(idOfProgram);
  }

  @override
  save(_nameOfProgram) {
    _databaseService.addProgram(_nameOfProgram);
  }
}
