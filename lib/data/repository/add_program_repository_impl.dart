


import 'package:workoutday/data/services/firestore_service.dart';
import 'package:workoutday/domain/repository/add_program_repository.dart';

class AddProgramRepositoryImpl implements AddProgramRepository {

  DatabaseService databaseService = DatabaseService();

  @override
  delete(idOfProgram) {
    databaseService.deleteProgram(idOfProgram);
  }

  @override
  save(_nameOfProgram) {
    databaseService.addProgram(_nameOfProgram);
  }

}