


import 'package:workoutday/core/domain/repository/add_exercise_repository.dart';

import '../firestore_service.dart';



class AddExerciseRepositoryImpl implements AddExerciseRepository {

  @override
  save(_nameOfExercise, idOfProgram ) {
    DatabaseService databaseServiceForAddExercise = DatabaseService.programs(programId: idOfProgram);
    databaseServiceForAddExercise.addExercise(_nameOfExercise);
  }

  @override
  delete(_idOfExercise, _programId) {
    DatabaseService databaseServiceForDeleteExercise = DatabaseService.programs(programId: _programId);
    databaseServiceForDeleteExercise.deleteExercise(_idOfExercise);
  }



}