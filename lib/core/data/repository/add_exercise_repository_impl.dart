


import 'package:workoutday/core/domain/repository/add_exercise_repository.dart';

import '../firestore_service.dart';



class AddExerciseRepositoryImpl implements AddExerciseRepository {

  @override
  save(_nameOfExercise, idOfProgram ) {
    DatabaseService databaseServiceForAddExercise = DatabaseService.exercises(programId: idOfProgram);
    databaseServiceForAddExercise.addExercise(nameOfExercise: _nameOfExercise);
  }

  @override
  delete(_idOfExercise, _programId) {
    DatabaseService databaseServiceForDeleteExercise = DatabaseService.exercises(programId: _programId);
    databaseServiceForDeleteExercise.deleteExercise(idOfExercise: _idOfExercise);
  }



}