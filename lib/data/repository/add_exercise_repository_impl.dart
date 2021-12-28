


import 'package:workoutday/data/services/firestore_service.dart';
import 'package:workoutday/domain/repository/add_exercise_repository.dart';

class AddExerciseRepositoryImpl implements AddExerciseRepository {

  @override
  save(_nameOfExercise, idOfProgram ) {
    DatabaseService databaseServiceForAddExercise = DatabaseService(programId: idOfProgram);
    databaseServiceForAddExercise.addExercise(_nameOfExercise);
  }

  @override
  delete(_idOfExercise) {
    // TODO: implement delete
    throw UnimplementedError();
  }



}