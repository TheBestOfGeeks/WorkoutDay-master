


import 'package:workoutday/data/services/firestore_service.dart';
import 'package:workoutday/domain/repository/add_program_repository.dart';

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